package com.ruoyi.project.xerswitch.controller;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.xerswitch.document.XerSwLog;
import com.ruoyi.project.xerswitch.domain.XerSwitch;
import com.ruoyi.project.xerswitch.mqtt.IMqttSender;
import com.ruoyi.project.xerswitch.service.IXerSwitchService;
import com.ruoyi.project.xerswitch.service.impl.XerSwitchLogServiceImpl;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/xersw/switch")
@Api("智能开关")
public class XerSwitchController extends BaseController {
    @Autowired
    private IXerSwitchService xerSwitchService;
    @Autowired
    private XerSwitchLogServiceImpl xerSwitchLogService;
    @Autowired
    private IMqttSender iMqttSender;

    /**
     * 设置开关状态
     *
     * @param deviceId 设备ID 0-代表所有
     * @param switchA  1-开，0-关
     * @param switchB  1-开，0-关
     * @return
     */
    @RequestMapping(value = "/set", method = RequestMethod.POST)
    @ApiOperation("设置开关的状态，1-开 0-关")
    public AjaxResult SetSwitch(@RequestParam long deviceId, @RequestParam String switchA, @RequestParam String switchB) {
        System.out.println("0。");
        if (deviceId != 0) {
            XerSwitch xerSwitch = xerSwitchService.selectXerSwitchById(deviceId);
            if (xerSwitch.getState().equals("1")) {
                //发送指令到mqtt
                String topic = "set/switch/" + deviceId;
                String payload  = "{\"deviceId\":\"" + deviceId + "\",\"state\":\"1" + "\",\"switchA\":\"" + (String)switchA + "\",\"switchB\":\"" + (String)switchB+"\"}";
                iMqttSender.sendToMqtt(topic,payload);
            }
        }
        return toAjax(1);
    }

    /**
     * 获取开关监测数据
     *
     * @param deviceId 设备ID 0-代表所有
     * @return
     */
    @RequestMapping(value = "/get/status/{deviceId}", method = RequestMethod.GET)
    @ApiOperation("获取开关监测数据")
    public AjaxResult GetStatus(@PathVariable("deviceId") Long deviceId) {
        if (deviceId != 0) {
            XerSwitch xerSwitch = xerSwitchService.selectXerSwitchById(deviceId);
            if (xerSwitch.getState().equals("1")) {
                String topic = "get/monitor/" + deviceId;
                String payload = "00";    //前两位占位，从第三位开始存储
                //发送指令到mqtt
                iMqttSender.sendToMqtt(topic, payload);
            }
        }
        return toAjax(1);
    }

    /**
     * 查询智能开关列表
     */
    @PreAuthorize("@ss.hasPermi('xersw:switch:list')")
    @GetMapping("/list")
    public TableDataInfo list(XerSwitch xerSwitch) {
        startPage();
        List<XerSwitch> list = xerSwitchService.selectXerSwitchList(xerSwitch);
        return getDataTable(list);
    }

    /**
     * 查询智能开关检测日志列表
     */
    @PreAuthorize("@ss.hasPermi('xersw:switch:list')")
    @GetMapping("/log/list/{deviceId}")
    @ApiOperation("获取开关监测数据列表")
    public TableDataInfo logList(@PathVariable Long deviceId){
        List<XerSwLog> list=xerSwitchLogService.getXerSwitchLogByDeviceId(deviceId);
        return getDataTable(list);
    }

    /**
     * 导出智能开关列表
     */
    @PreAuthorize("@ss.hasPermi('xersw:switch:export')")
    @Log(title = "智能开关", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(XerSwitch xerSwitch) {
        List<XerSwitch> list = xerSwitchService.selectXerSwitchList(xerSwitch);
        ExcelUtil<XerSwitch> util = new ExcelUtil<XerSwitch>(XerSwitch.class);
        return util.exportExcel(list, "switch");
    }

    /**
     * 获取智能开关详细信息
     */
    @PreAuthorize("@ss.hasPermi('xersw:switch:query')")
    @GetMapping(value = "/{deviceId}")
    public AjaxResult getInfo(@PathVariable("deviceId") Long deviceId) {
        return AjaxResult.success(xerSwitchService.selectXerSwitchById(deviceId));
    }

    /**
     * 新增智能开关
     */
    @PreAuthorize("@ss.hasPermi('xersw:switch:add')")
    @Log(title = "智能开关", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody XerSwitch xerSwitch) {
        return toAjax(xerSwitchService.insertXerSwitch(xerSwitch));
    }

    /**
     * 修改智能开关
     */
    @PreAuthorize("@ss.hasPermi('xersw:switch:edit')")
    @Log(title = "智能开关", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody XerSwitch xerSwitch) {
        return toAjax(xerSwitchService.updateXerSwitch(xerSwitch));
    }

    /**
     * 删除智能开关
     */
    @PreAuthorize("@ss.hasPermi('xersw:switch:remove')")
    @Log(title = "智能开关", businessType = BusinessType.DELETE)
    @DeleteMapping("/{deviceIds}")
    public AjaxResult remove(@PathVariable Long[] deviceIds) {
        return toAjax(xerSwitchService.deleteXerSwitchByIds(deviceIds));
    }
}
