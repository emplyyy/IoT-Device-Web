package com.ruoyi.project.xerswitch.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.project.xerswitch.domain.XerSwitch;
import com.ruoyi.project.xerswitch.mapper.XerSwitchMapper;
import com.ruoyi.project.xerswitch.service.IXerSwitchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class XerSwitchServiceImpl implements IXerSwitchService {
    @Autowired
    private XerSwitchMapper xerSwitchMapper;

    /**
     * 查询智能开关
     *
     * @param deviceId 智能开关ID
     * @return 智能开关
     */
    @Override
    public XerSwitch selectXerSwitchById(Long deviceId) {
        return xerSwitchMapper.selectXerSwitchById(deviceId);
    }

    /**
     * 查询智能开关列表
     *
     * @param xerSwitch 智能开关
     * @return 智能开关
     */
    @Override
    public List<XerSwitch> selectXerSwitchList(XerSwitch xerSwitch) {
        return xerSwitchMapper.selectXerSwitchList(xerSwitch);
    }

    /**
     * 新增智能开关
     *
     * @param xerSwitch 智能开关
     * @return 结果
     */
    @Override
    public int insertXerSwitch(XerSwitch xerSwitch) {
        xerSwitch.setCreateTime(DateUtils.getNowDate());
        xerSwitch.setUserName(SecurityUtils.getUsername());
        return xerSwitchMapper.insertXerSwitch(xerSwitch);
    }

    /**
     * 修改智能开关
     *
     * @param xerSwitch 智能开关
     * @return 结果
     */
    @Override
    public int updateXerSwitch(XerSwitch xerSwitch) {
        xerSwitch.setUpdateTime(DateUtils.getNowDate());
        return xerSwitchMapper.updateXerSwitch(xerSwitch);
    }

    /**
     * 删除智能开关信息
     *
     * @param deviceId 智能开关ID
     * @return 结果
     */
    @Override
    public int deleteXerSwitchById(Long deviceId) {
        return xerSwitchMapper.deleteXerSwitchById(deviceId);
    }

    /**
     * 批量删除智能开关
     *
     * @param deviceIds 需要删除的智能开关ID
     * @return 结果
     */
    @Override
    public int deleteXerSwitchByIds(Long[] deviceIds) {
        return xerSwitchMapper.deleteXerSwitchByIds(deviceIds);
    }


}
