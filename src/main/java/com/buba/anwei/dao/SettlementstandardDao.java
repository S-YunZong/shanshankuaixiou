package com.buba.anwei.dao;

import com.buba.anwei.pojo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface SettlementstandardDao {
    /*------------厂商结算标准---------*/
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
    List<AwManufacturerSettlementstandard> selsettlementstandard(@Param("settlementstandard") AwManufacturerSettlementstandard settlementstandard);
    /*新增厂商结算标准*/
    boolean insSettlementstandard(@Param("settlementstandard") AwManufacturerSettlementstandard settlementstandard);
    /*查询结算部门*/
    List<AwDepartment> selAwDepartment();
    /*删除厂商结算标准*/
    boolean delsettlementstandard(int id);
    /*查询厂商结算标准*/
    AwManufacturerSettlementstandard selAwManufacturerSettlementstandard(@Param("id") int id);
    /*修改厂商结算标准*/
    boolean updsettlementstandard(@Param("settlementstandard") AwManufacturerSettlementstandard settlementstandard);
    /*厂商结算标准导出 查找数据*/
    List<AwManufacturerSettlementstandard> seldaochu(@Param("id") String[] id);
    /*厂商结算标准导入 添加数据*/
    boolean insdaoru (@Param("list") List<AwManufacturerSettlementstandard> list);
    /*------------内部结算标准---------*/
    /*查询内部结算标准*/
    List<AwInteriorSettlementstandard> selInterior(@Param("Interior") AwInteriorSettlementstandard Interior);
    /*新增内部结算标准*/
    boolean insInterior(@Param("Interior") AwInteriorSettlementstandard Interior);
    /*删除内部结算标准*/
    boolean delInterior(int id);
    /*查询内部结算标准*/
    AwInteriorSettlementstandard selInteriorid(int id);
    /*修改内部结算标准*/
    boolean updInterior(@Param("Interior") AwInteriorSettlementstandard Interior);
    /*内部结算标准导出*/
    List<AwInteriorSettlementstandard> selInteriordc(@Param("id") String[] id);
    /*内部结算标准导入*/
    boolean insInteriordr(@Param("list") List<AwInteriorSettlementstandard> list);
}
