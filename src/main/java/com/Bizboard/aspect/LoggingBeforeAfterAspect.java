package com.Bizboard.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
@Aspect // 이 클래스가 Aspect Oriented Programming (AOP)를 위한 Aspect 임을 선언
@Component // 이 클래스가 Spring 컴포넌트이며 Spring 프레임워크에 의해 자동으로 감지되고 관리되어야 함을 나타냄
public class LoggingBeforeAfterAspect {
	/*
    // 포인트컷을 정의합니다. com.test.controller.CommonController 클래스 내의 모든 메서드 실행과 일치합니다.
    @Pointcut("execution(* com.test.controller.CommonController.*(..))")
    public void commonControllerMethods() {} // 메서드 본문은 비워둡니다. 이 메서드는 포인트컷을 식별하는 데 사용됩니다.

    // 정의된 포인트컷을 사용하여 Before 어드바이스를 선언합니다. 대상 메서드가 실행되기 전에 실행됩니다.
    @Before("commonControllerMethods()")
    public void logBeforeMethod(JoinPoint joinPoint) {
        String methodName = joinPoint.getSignature().getName(); // 현재 실행되는 메서드의 이름을 가져옵니다.
        System.out.println("@Before 현재 호출된 메서드명 : " + methodName); // 로그 메시지를 출력합니다.
    }
    
    // 정의된 포인트컷을 사용하여 After 어드바이스를 선언합니다. 대상 메서드가 실행된 후에 실행됩니다.
    @After("commonControllerMethods()")
    public void logAfterMethod(JoinPoint joinPoint) {
        System.out.println("@After 메서드 명 : " + joinPoint.getSignature().getName() + " 실행이 완료되었습니다."); // 로그 메시지를 출력합니다.
    }
    */
}

