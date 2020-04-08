package com.buba.anwei.pojo;

import lombok.Data;

@Data
public class AwDepartment {
    private Integer id;

    private String departmentName;//部门名称

    private String departmentJobnum;//部门工号

    private String status;//状态

    private String departmentPhone;//部门电话

    private Integer areaId;//地址

    private String address;//详细地址

    private String serviceType;//服务品类

    private Integer deliveryServiceOrders;//(是否愿意交付服务单 0 愿意，1不愿意)

    private String headquartersDepartment;//总部部门

    private String businessCenter;//业务中心

    private Integer upDepartmentId;//上级部门

    private String serviceArea;//服务区域

    }