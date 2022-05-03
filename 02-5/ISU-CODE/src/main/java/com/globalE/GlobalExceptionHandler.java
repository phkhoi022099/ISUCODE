package com.globalE;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(MyException.class)
    public ModelAndView handleMyException(MyException mex) {
 
        ModelAndView model = new ModelAndView();
        model.addObject("errCode", mex.getErrCode());
        model.addObject("msg", mex.getErrMsg());
        model.setViewName("error");
        return model;
    }
	
	@ExceptionHandler(Exception.class)
    public ModelAndView handleException(Exception ex) {
 
        ModelAndView model = new ModelAndView();
        model.addObject("msg", "Something is wrong. plz try again");
        model.setViewName("error");
        return model;
 
    }
}
