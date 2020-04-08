package com.buba.anwei.pojo;

import lombok.Data;

@Data
public class AwProduct {
    private Integer id;

    private String productName;//产品名称

    private Integer parentId;//父id

    private String model;//型号

    private String status;//产品状态

    private Integer disableb;//删除标志0可用 1不可用

}