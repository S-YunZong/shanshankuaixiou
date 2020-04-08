package com.buba.anwei.Controller;

import com.buba.anwei.pojo.*;
import com.buba.anwei.service.SettlementstandardService;
import com.buba.anwei.util.TemplateExcelUtil;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * \* User: 智慧
 * \* Date: 2020/3/27
 * \* Time: 21:01
 * \* 模块:
 * \
 */
@RequestMapping("user")
@Controller
public class SettlementstandardController {
    @Resource
    private SettlementstandardService settlementstandardService;

    /*厂商名称查询*/
    @RequestMapping("selAwVendor")
    @ResponseBody
    public List<AwVendor> selAwVendor(){
        List<AwVendor> se=settlementstandardService.selVendor();
        return se;
    }
    /*服务类型查询*/
    @RequestMapping("selAwServiceType")
    @ResponseBody
    public List<AwServiceType> selAwServiceType(){
        List<AwServiceType> list=settlementstandardService.selServiceType();
        return list;
    }
    /*保质标志查询*/
    @RequestMapping("selAwSign")
    @ResponseBody
    public List<AwSign> selAwSign(){
        List<AwSign> list=settlementstandardService.selAwSign();
        return list;
    }

    /*品牌查询*/
    @RequestMapping("selbrand")
    @ResponseBody
    public List<AwBrand> selbrand(){
        List<AwBrand> list=settlementstandardService.selbrand();
        return list;
    }
    /*产品层次查询*///品类
    @RequestMapping("selProduct")
    @ResponseBody
    public List<AwProduct> selProduct(){
        List<AwProduct> list=settlementstandardService.selProduct();
        return list;
    }
    //二级品类
    @RequestMapping("seltwoProduct")
    @ResponseBody
    public List<AwProduct> seltwoProduct(String id){
        List<AwProduct> list=settlementstandardService.seltwoProduct(id);
        return list;
    }
    //商品组
    @RequestMapping("selCommodityGroup")
    @ResponseBody
    public List<AwCommodityGroup> selCommodityGroup(){
        List<AwCommodityGroup> list=settlementstandardService.selCommodityGroup();
        return list;
    }
    /*维修措施类型查询*/
    @RequestMapping("selMaintenanceMeasuresType")
    @ResponseBody
    public List<AwMaintenanceMeasuresType> selMaintenanceMeasuresType(){
        List<AwMaintenanceMeasuresType> list=settlementstandardService.selMaintenanceMeasuresType();
        return list;
    }
    /*查询厂商结算标准*/
    @RequestMapping("selsettlementstandard")
    @ResponseBody
    public LimitVo selsettlementstandard(LimitVo page,AwManufacturerSettlementstandard settlementstandard){
        settlementstandardService.selsettlementstandard(page,settlementstandard);
        return page;
    }
    /*查询厂商结算标准重复*/
    @RequestMapping("selsettlementstandard2")
    @ResponseBody
    public int selsettlementstandard(AwManufacturerSettlementstandard settlementstandard){
        List<AwManufacturerSettlementstandard> list=settlementstandardService.selsettlementstandard2(settlementstandard);
        return list.size();
    }
    /*新增厂商结算标准*/
    @RequestMapping("insSettlementstandard")
    @ResponseBody
    public boolean insSettlementstandard(AwManufacturerSettlementstandard settlementstandard) {
        boolean b=settlementstandardService.insSettlementstandard(settlementstandard);
        return b;
    }
    /*查询结算部门*/
    @RequestMapping("selAwDepartment")
    @ResponseBody
    public List<AwDepartment> selAwDepartment(){
        List<AwDepartment> list=settlementstandardService.selAwDepartment();
        return list;
    }
    /*删除厂商结算标准*/
    @RequestMapping("delsettlementstandard")
    @ResponseBody
    public boolean delsettlementstandard(int id){
        boolean b=settlementstandardService.delsettlementstandard(id);
        return b;
    }
    /*查询厂商结算标准*/
    @RequestMapping("selAwManufacturerSettlementstandard")
    @ResponseBody
    public AwManufacturerSettlementstandard selAwManufacturerSettlementstandard(Integer id){
        AwManufacturerSettlementstandard as=settlementstandardService.selAwManufacturerSettlementstandard(id);
        return as;
    }
    /*修改厂商结算标准*/
    @RequestMapping("updsettlementstandard")
    @ResponseBody
    public boolean updsettlementstandard(AwManufacturerSettlementstandard settlementstandard){
        boolean boo=settlementstandardService.updsettlementstandard(settlementstandard);
        return boo;
    }
    //厂商结算标准导出
    @RequestMapping("csoutput")
    @ResponseBody
    public boolean csoutput(@RequestParam("filename") MultipartFile filename,@RequestParam("id") String id[],HttpSession session) throws IOException {
        boolean b=false;
        Date time=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
        String format=sdf.format(time);
        String format2=sdf2.format(time);
        File file1 = new File("E://追云工作室/山山快修/作业/xlsx文件存储");
        if(!file1.exists()) {//判断目录是否存在
            file1.mkdirs();//创建目录
        }
        //存储位置起新名字
        String target=file1+"/厂商结算标准_"+format+".xlsx";
       /* //模板名称
        String temp="hebeiTemp.xlsx";
        //获取模板的绝对路径
        temp=session.getServletContext().getRealPath("template")+File.separator+temp;*/
        //表格头部4参数
        String[] params=new String[4];
        AwUser user= (AwUser) session.getAttribute("USER_SESSION");
        params[0]="2019-1-2";
        params[1]="2019-2-20";
        params[2]=user.getUserName();
        params[3]=format2;
        //内容
        List<AwManufacturerSettlementstandard> listarea = settlementstandardService.seldaochu(id);
        if(listarea.size()!=0){
            b=true;
        }
        List<String> propertyList=headersId();
        TemplateExcelUtil ExcelUtil=new TemplateExcelUtil();
        ExcelUtil.exportExcel(filename.getInputStream(), target, params, propertyList, listarea);
        return b;
    }
    private List<String> headersId() {
        // TODO Auto-generated method stub
        List<String> list=new ArrayList<>();
        list.add("closeDepartment");//结算部门
        list.add("source");//来源
        list.add("serviceType");//服务类型
        list.add("qualityStandard");//保质标志
        list.add("brand");//品牌
        list.add("productId");//品类
        list.add("twoProductId");//二级品类
        list.add("commodityGroupId");//商品组
        list.add("maintenanceMeasures");//维修措施类型
        list.add("closeType");//结算类型
        list.add("closeScale");//结算比例值
        return list;
    }
    //厂商结算标准导入
    @RequestMapping("csdaoru")
    @ResponseBody
    public boolean csdaoru(@RequestParam("filename") MultipartFile filename) throws IOException {
        List<List<String>> poiin = TemplateExcelUtil.readExcel(filename.getInputStream());
        List<AwManufacturerSettlementstandard> list=new ArrayList<>();
        AwManufacturerSettlementstandard i=null;
        for(int p=4;p<poiin.size();p++) {
            i=new AwManufacturerSettlementstandard();
            //判断比填选项是否为空
            if(poiin.get(p).get(1)==null&&poiin.get(p).get(9)==null&&poiin.get(p).get(10)==null&&poiin.get(p).get(1)==""&&poiin.get(p).get(9)==""&&poiin.get(p).get(10)==""){
                //跳过当前循环，继续循环
                continue;
            }
            i.setSource(poiin.get(p).get(1));//来源
            i.setServiceType(poiin.get(p).get(2));//服务类型
            i.setQualityStandard(poiin.get(p).get(3));//质保标志
            i.setBrand(poiin.get(p).get(4));//品牌
            i.setProductId(poiin.get(p).get(5));//品类
            i.setTwoProductId(poiin.get(p).get(6));//二级品类
            i.setCommodityGroupId(poiin.get(p).get(7));//商品组
            i.setMaintenanceMeasures(poiin.get(p).get(8));//维修措施类型
            i.setCloseType(poiin.get(p).get(9));//结算类型
            i.setCloseScale(poiin.get(p).get(10));//结算值
            List<AwManufacturerSettlementstandard> li=settlementstandardService.selsettlementstandard2(i);
            //确保数据不重复
            if(li.size()==0){
                list.add(i);
            }
        }
        boolean inspoi=false;
        if(list.size()!=0){
            inspoi = settlementstandardService.insdaoru(list);
        }
        return inspoi;

    }

    private class PathTest {
    }
}
