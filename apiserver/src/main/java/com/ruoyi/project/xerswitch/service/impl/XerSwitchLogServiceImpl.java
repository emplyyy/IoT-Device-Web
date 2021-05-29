package com.ruoyi.project.xerswitch.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.project.xerswitch.document.XerSwLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class XerSwitchLogServiceImpl {
    @Autowired
    private MongoTemplate mongoTemplate;

    /**
     * 查询所有
     *
     * @rturn
     */
    public List<XerSwLog> findAll() {
        return mongoTemplate.findAll(XerSwLog.class);
    }

    /**
     * 根据设备ID查询数据
     *
     * @param deviceId
     * @return
     */
    public List<XerSwLog> getXerSwitchLogByDeviceId(Long deviceId) {
        Query query = new Query(Criteria.where("deviceId").is(deviceId)).limit(100);
        return mongoTemplate.find(query.with(Sort.by(Sort.Order.desc("createTime"))), XerSwLog.class);
    }

    /**
     * 根据ID查询数据
     *
     * @param id
     * @return
     */
    public XerSwLog getXerSwitchLogById(String id) {
        Query query = new Query(Criteria.where("_id").is(id));
        return mongoTemplate.findOne(query, XerSwLog.class);
    }

    /**
     * 保存对象
     *
     * @param xerSwLog
     * @return
     */
    public String saveObj(XerSwLog xerSwLog) {
        xerSwLog.setCreateTime(DateUtils.getNowDate());
        mongoTemplate.save(xerSwLog);
        return "save success";
    }

    /**
     * 更新对象
     *
     * @param xerSwLog
     * @return
     */
    public String updateXerSwitchLog(XerSwLog xerSwLog) {
        Query query = new Query(Criteria.where("_id").is(xerSwLog.getId()));
        Update update = new Update()
                .set("deviceId", xerSwLog.getDeviceId())
                .set("switchA", xerSwLog.getSwitchA())
                .set("switchB", xerSwLog.getSwitchB())
                .set("humidity", xerSwLog.getHumidity())
                .set("temperature", xerSwLog.getTemperature());
        // 更新第一条并返回第一条
        mongoTemplate.updateFirst(query, update, XerSwLog.class);
        return "success-update";
    }

    /**
     * 删除对象
     *
     * @param xerSwLog
     * @return
     */
    public String deleteXerSwitchLog(XerSwLog xerSwLog) {
        mongoTemplate.remove(xerSwLog);
        return "success";
    }

    /**
     * 根据ID删除对象
     *
     * @param id
     * @return
     */
    public String deleteXerSwitchLogById(String id) {
        XerSwLog xerSwLog = getXerSwitchLogById(id);
        deleteXerSwitchLog(xerSwLog);
        return "success-delete";
    }


}
