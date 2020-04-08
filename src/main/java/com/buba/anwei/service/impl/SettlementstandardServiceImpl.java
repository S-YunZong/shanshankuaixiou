package com.buba.anwei.service.impl;

import com.buba.anwei.dao.SettlementstandardDao;
import com.buba.anwei.pojo.*;
import com.buba.anwei.service.SettlementstandardService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * \* User: 智慧
 * \* Date: 2020/3/27
 * \* Time: 20:27
 * \* 模块:
 * \
 */
@Service
public class SettlementstandardServiceImpl implements SettlementstandardService {

    @Resource
    private SettlementstandardDao settlementstandardDao;
    @Override
    public List<AwVendor> selVendor() {
        return settlementstandardDao.selVendor();
    }

    @Override
    public List<AwServiceType> selServiceType() {
        return settlementstandardDao.selServiceType();
    }

    @Override
    public List<AwSign> selAwSign() {
        return settlementstandardDao.selAwSign();
    }

    @Override
    public List<AwBrand> selbrand() {
        return settlementstandardDao.selbrand();
    }

    @Override
    public List<AwProduct> selProduct() {
        return settlementstandardDao.selProduct();
    }

    @Override
    public List<AwProduct> seltwoProduct(String id) {
        return settlementstandardDao.seltwoProduct(id);
    }

    @Override
    public List<AwCommodityGroup> selCommodityGroup() {
        return settlementstandardDao.selCommodityGroup();
    }

    @Override
    public List<AwMaintenanceMeasuresType> selMaintenanceMeasuresType() {
        return settlementstandardDao.selMaintenanceMeasuresType();
    }

    @Override
    public void selsettlementstandard(LimitVo page,AwManufacturerSettlementstandard settlementstandard) {
        PageHelper.offsetPage(page.getOffset(), page.getLimit());
        List<AwManufacturerSettlementstandard> list = settlementstandardDao.selsettlementstandard(settlementstandard);
        PageInfo<AwManufacturerSettlementstandard> info = new PageInfo<>(list);
        page.setTotal(Integer.valueOf(String.valueOf(info.getTotal())));
        page.setRows(info.getList());
    }

    @Override
    public List<AwManufacturerSettlementstandard> selsettlementstandard2(AwManufacturerSettlementstandard settlementstandard) {
        return settlementstandardDao.selsettlementstandard(settlementstandard);
    }

    @Override
    public boolean insSettlementstandard(AwManufacturerSettlementstandard settlementstandard) {
        return settlementstandardDao.insSettlementstandard(settlementstandard);
    }

    @Override
    public List<AwDepartment> selAwDepartment() {
        return settlementstandardDao.selAwDepartment();
    }

    @Override
    public boolean delsettlementstandard(int id) {
        return settlementstandardDao.delsettlementstandard(id);
    }

    @Override
    public AwManufacturerSettlementstandard selAwManufacturerSettlementstandard(int id) {
        return settlementstandardDao.selAwManufacturerSettlementstandard(id);
    }

    @Override
    public boolean updsettlementstandard(AwManufacturerSettlementstandard settlementstandard) {
        return settlementstandardDao.updsettlementstandard(settlementstandard);
    }

    @Override
    public List<AwManufacturerSettlementstandard> seldaochu(String[] id) {
        return settlementstandardDao.seldaochu(id);
    }

    @Override
    public boolean insdaoru(List<AwManufacturerSettlementstandard> list) {
        return settlementstandardDao.insdaoru(list);
    }
}
