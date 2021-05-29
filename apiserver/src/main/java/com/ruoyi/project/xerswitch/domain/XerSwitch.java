package com.ruoyi.project.xerswitch.domain;

import com.ruoyi.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


public class XerSwitch extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 设备ID */
    private Long deviceId;

    /** 设备名称 */
    private String deviceName;

    /** 状态 */
    private String state;

    private String switchA;

    private String switchB;

    /** 设备分类 */
    private String category;

    /** 用户ID */
    private Long userId;

    /** 用户昵称 */
    private String userName;

    /** 删除标识 */
    private String delFlg;

    public void setDeviceId(Long deviceId)
    {
        this.deviceId = deviceId;
    }

    public Long getDeviceId()
    {
        return deviceId;
    }
    public void setDeviceName(String deviceName)
    {
        this.deviceName = deviceName;
    }

    public String getDeviceName()
    {
        return deviceName;
    }

    public void setSwitchA(String switchA)
    {
        this.switchA = switchA;
    }
    public String getSwitchA()
    {
        return switchA;
    }

    public void setSwitchB(String switchB)
    {
        this.switchB = switchB;
    }
    public String getSwitchB()
    {
        return switchB;
    }


    public void setState(String state)
    {
        this.state = state;
    }

    public String getState()
    {
        return state;
    }

    public void setCategory(String category)
    {
        this.category = category;
    }

    public String getCategory()
    {
        return category;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getUserName()
    {
        return userName;
    }
    public void setDelFlg(String delFlg)
    {
        this.delFlg = delFlg;
    }

    public String getDelFlg()
    {
        return delFlg;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("deviceId", getDeviceId())
            .append("deviceName", getDeviceName())
            .append("switchState", getSwitchA())
            .append("switchState", getSwitchB())
            .append("state", getState())
            .append("category", getCategory())
            .append("createTime", getCreateTime())
            .append("userId", getUserId())
            .append("userName", getUserName())
            .append("remark", getRemark())
            .append("delFlg", getDelFlg())
            .toString();
    }
}
