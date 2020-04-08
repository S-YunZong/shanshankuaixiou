package com.buba.anwei.service;

import com.buba.anwei.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * \* User: 智慧
 * \* Date: 2020/3/27
 * \* Time: 20:26
 * \* 模块:
 * \
 */
public interface SettlementstandardService {
    /*厂商名称查询*/
    List<AwVendor> selVendor();
    /*服务类型查询*/
    List<AwServiceType> selServiceType();
    /*保质标志查询*/
    List<AwSign> selAwSign();
    /*品牌查询*/
    List<AwBrand> selbrand();
    /*产品层次查询*/
    List<AwProduct> selProduct();//品类
    List<AwProduct> seltwoProduct(String id);//二级品类
    List<AwCommodityGroup> selCommodityGroup();//商品组
    /*维修措施类型查询*/
    List<AwMaintenanceMeasuresType> selMaintenanceMeasuresType();
    /*查询厂商结算标准*/
    void selsettlementstandard(LimitVo page,AwManufacturerSettlementstandard settlementstandard);
    /*查询厂商结算标准重复*/
    List<AwManufacturerSettlementstandard> selsettlementstandard2(AwManufacturerSettlementstandard settlementstandard);
    /*新增厂商结算标准*/
    boolean insSettlementstandard(AwManufacturerSettlementstandard settlementstandard);
    /*查询结算部门*/
    List<AwDepartment> selAwDepartment();
    /*删除厂商结算标准*/
    boolean delsettlementstandard(int id);
    /*查询厂商结算标准*/
    AwManufacturerSettlementstandard selAwManufacturerSettlementstandard(int id);
    /*修改厂商结算标准*/
    boolean updsettlementstandard(@Param("settlementstandard") AwManufacturerSettlementstandard settlementstandard);
    /*导出*/
    List<AwManufacturerSettlementstandard> seldaochu(@Param("id") String[] id);
    /*导入 添加数据*/
    boolean insdaoru (@Param("list") List<AwManufacturerSettlementstandard> list);
}
