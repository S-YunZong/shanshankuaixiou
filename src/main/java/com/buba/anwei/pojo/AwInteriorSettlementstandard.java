package com.buba.anwei.pojo;

import lombok.Data;

@Data
public class AwInteriorSettlementstandard {
    private Integer id;
    private String shangyouName;//上游名称
    private String downstreamName;//下游名称

    private String serviceType;//服务类型

    private String qualityStandard;//保质标志
    private String brand;//品牌
    private String productId;//品类

    private String twoProductId;//二级品类

    private String commodityGroupId;//商品组
    private String maintenanceMeasures;//维修措施类型

    private String closeType;//结算类型

    private String closeScale;//结算比例值


    }