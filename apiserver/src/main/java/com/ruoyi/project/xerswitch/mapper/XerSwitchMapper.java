package com.ruoyi.project.xerswitch.mapper;

import com.ruoyi.project.xerswitch.domain.XerSwitch;
import java.util.List;

public interface XerSwitchMapper
{
    /**
     * 查询智能开关
     *
     * @param deviceId 智能开关ID
     * @return 智能开关
     */
    public XerSwitch selectXerSwitchById(Long deviceId);

    /**
     * 查询智能开关列表
     *
     * @param xerSwitch 智能开关
     * @return 智能开关集合
     */
    public List<XerSwitch> selectXerSwitchList(XerSwitch xerSwitch);

    /**
     * 新增智能开关
     *
     * @param xerSwitch 智能开关
     * @return 结果
     */
    public int insertXerSwitch(XerSwitch xerSwitch);

    /**
     * 修改智能开关
     *
     * @param xerSwitch 智能开关
     * @return 结果
     */
    public int updateXerSwitch(XerSwitch xerSwitch);

    /**
     * 删除智能开关
     *
     * @param deviceId 智能开关ID
     * @return 结果
     */
    public int deleteXerSwitchById(Long deviceId);

    /**
     * 批量删除智能开关
     *
     * @param deviceIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteXerSwitchByIds(Long[] deviceIds);
}
