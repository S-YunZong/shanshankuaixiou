package com.buba.anwei.pojo;

import lombok.Data;

@Data
public class AwVendor {
    private Integer id;

    private String vendorCode;//厂商编码

    private Integer vendorTypeId;//厂商类型id

    private String manufacturerCompanyName;//厂商名称

    private Integer contractingDepartmentId;//签约部门id

    private String manufacturerPhone;//厂商电话

    private Double accountBalance;//账户类型

    private Integer areaId;//地址

    private String address;//详细地址

    private String status;//状态

    }