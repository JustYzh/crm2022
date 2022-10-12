package com.yzh.controller.workbench;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: SSM
 * @description
 * @author: Yzh
 * @create: 2022-09-19 13:27
 **/
@Controller
public class WorkbenchIndexController {
    @RequestMapping("workbench/toindex.action")
    public String toindex(){

        return "workbench/index";
    }

}
