#include <NTPClient.h>
#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <WiFiUdp.h>
#include <ArduinoJson.h>
#include <EEPROM.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <time.h>
#include <SimpleDHT.h>

#define ARDUINOJSON_DECODE_UNICODE 1
#define Relay1 15
#define Relay2 14
SimpleDHT11 dht11(13);
byte temperature = 0;
byte humidity = 0;
byte val1;
byte val2;

String ssid = "***";
String password = "***";
const char* mqtt_server = "";
const char* mqtt_ssid = "";
const char* mqtt_password = "";

char deviceID[] = "18";
char* ClientId="Nodemcu_";

char subtopic[] = "set/switch/";
char* pubtopic = "state";
char buff[200]; 

WiFiClient espClient;
PubSubClient client(espClient);
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "ntp1.aliyun.com", 0, 60000);


/*存字符串到eeprom*************************************************/
void set_String(int b,String str)
{
  for (int i = 0; i < str.length(); i++)
  {
    EEPROM.write(b + i, str[i]);
  }
  EEPROM.commit();
}
/*从eeprom取字符串*************************************************/
String get_String(int a)
{ 
  String data = "";
  //从EEPROM中逐个取出每一位的值，并链接
  for (int i = 0; EEPROM.read(a + i)!=0xff; i++)
  {
    data += char(EEPROM.read(a + i));
  }
  return data;
}
/*清空eeprom*******************************************************/
void clear_All() 
{
  EEPROM.begin(512);
  // write a 0 to all 512 bytes of the EEPROM
  for (int i = 0; i < 512; i++) 
  {
    EEPROM.write(i, 512);
  }
}
/*微信智能配网**********************************************************/
void smartConfig()
{
  WiFi.mode(WIFI_STA);
  Serial.println("\r\nWait for Smartconfig等待连接");
  delay(2000);
  WiFi.beginSmartConfig();
  while (1)
  {
    delay(1000);
    Serial.print(".");
    if (WiFi.smartConfigDone())
    {
      Serial.println("SmartConfig Success");
      Serial.printf("SSID:%s\r\n", WiFi.SSID().c_str());
      Serial.printf("PSW:%s\r\n", WiFi.psk().c_str());
      WiFi.setAutoConnect(true);  // 设置自动连接
      delay(1000);
      ssid = WiFi.SSID().c_str();
      password = WiFi.psk().c_str();
      EEPROM.begin(512);
      clear_All();
      set_String(0,ssid);
      delay(100);
      set_String(100,password);
      delay(100);
      EEPROM.end();
      break;
    }
  }
}
/*wifi连接****************************************************/
void wifi_connect() 
{
  int i = 0;
  delay(10);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) 
  {
    delay(500);
    Serial.println("wifi connect...");
    i++;
    if(i>20)
    {
    smartConfig();
    break;
    }
  }
}
/*初始化wifi**********************************************/
void setup_wifi() 
{
  delay(10);
  EEPROM.begin(512);
  String ssid = get_String(0);
  String password = get_String(100);
  wifi_connect();
  Serial.println();
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}
/*时间戳****************************************************/
long getTimestamp() 
{
     timeClient.update();
     return timeClient.getEpochTime();
}
/*开机发布***************************************************/
void json_publish_start()
{
  char jsonbuff[200];
  StaticJsonDocument<300> doc; //声明一个JsonDocument对象
//  JsonObject myobj = doc.createNestedObject("myObject"); //添加一个对象节点

  doc["deviceId"]=deviceID;
  doc["state"]="1";
  doc["switchA"]="0";
  doc["switchB"]="0";
  doc["timestamp"] = getTimestamp();

  serializeJson(doc, jsonbuff);
  Serial.println(jsonbuff);
  client.publish(pubtopic,jsonbuff);
  memset(jsonbuff,0,sizeof(jsonbuff));

}

/*温湿度发布***************************************************/
void json_publish_dht11()
{
  val1 = digitalRead(Relay1); 
  val2 = digitalRead(Relay2); 
  dht11.read(&temperature, &humidity, NULL);
  char jsonbuff[200];
  StaticJsonDocument<300> doc; //声明一个JsonDocument对象
  doc["deviceId"]=deviceID;
  doc["state"]="1";
  doc["switchA"]=String(val1);
  doc["switchB"]=String(val2);
  doc["humidity"]=humidity;
  doc["Temperature"]=temperature;
  serializeJson(doc, jsonbuff);
  Serial.println(jsonbuff);
  client.publish("nodemonitor",jsonbuff);
  memset(jsonbuff,0,sizeof(jsonbuff));

}

/*json解析******************************************/
void json_controller(char* buf)
{
  client.publish(pubtopic,buf);
  StaticJsonDocument<300> doc;
  deserializeJson(doc, buf);
  const char* deviceId = doc["deviceId"];
  const char* switchA = doc["switchA"];
  const char* switchB = doc["switchB"];
  const char* state = doc["state"];

//  if(strcmp("C",state)==0)
//  {
//    EEPROM.begin(512);
//    set_String(200,deviceId);
//    delay(100);
//    EEPROM.end();   
//  }
  dht11.read(&temperature, &humidity, NULL);


  
  if(switchA == "1")
    digitalWrite(Relay1,HIGH);
  else
    digitalWrite(Relay1,LOW);
  
  if(switchB == "1")
    digitalWrite(Relay1,HIGH);
  else
    digitalWrite(Relay1,LOW);
   
  delay(1000);
  
}

/*订阅回调函数******************************************************/
void callback(char* subtopic, byte* payload, unsigned int length) 
{
  Serial.print("Message arrived [");
  Serial.print(subtopic);
  Serial.print("] ");
  
  for (int i = 0; i < length; i++) 
  {
    buff[i]=(char)payload[i];
  }
//  Serial.println(buff);
  json_controller(buff);
  memset(buff,0,sizeof(buff));
  delay(1000);
}

/*客户端重连接*******************************************************/
void reconnect() 
{
  while (!client.connected()) 
  {
    Serial.print("Attempting MQTT connection...");
    if (client.connect(ClientId+random(99999999),mqtt_ssid,mqtt_password))
    {
      Serial.println("connected");
      json_publish_start();
    } 
    else 
    {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      delay(5000);
    }
  }
}
/*初始化***********************************************/
void setup() 
{
  pinMode(Relay1, OUTPUT);
  pinMode(Relay2, OUTPUT);
  Serial.begin(115200);
  setup_wifi();
  delay(1000);
  srand((int)time(NULL));
  client.setServer(mqtt_server, 1883);
  client.connect(ClientId+random(99999999),mqtt_ssid,mqtt_password);
  
  Serial.println(/***********************************************/);
  strcat(subtopic,deviceID);
  Serial.println(subtopic);
  client.subscribe(subtopic);
  
  json_publish_start();
  client.setCallback(callback);
  delay(1000);
}
/*主循环**********************************************/
void loop() 
{
  if (!espClient.connected()) 
  {
    reconnect();
  }
  client.loop();

}

  
  
  
 
  
