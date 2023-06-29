package com.Bizboard.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect // 이 클래스가 Aspect Oriented Programming (AOP)를 위한 Aspect 임을 선언
@Component // 이 클래스가 Spring 컴포넌트이며 Spring 프레임워크에 의해 자동으로 감지되고 관리되어야 함을 나타냄
public class LoggingAroundAspect {
	/*
    // com.test.controller.CommonController 클래스 내의 모든 메서드 실행과 일치하는 포인트컷을 정의
    @Pointcut("execution(* com.test.controller.CommonController.*(..))")
    public void commonControllerMethods() {}

    // 정의된 포인트컷을 사용하는 어라운드 어드바이스를 선언. 이는 대상 메서드 실행 전후에 실행됨.
    @Around("commonControllerMethods()")
    public Object logAroundMethod(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        // Before 부분 - 대상 메서드가 실행되기 전에 실행됨
        String methodName = proceedingJoinPoint.getSignature().getName(); // 현재 실행되는 메서드의 이름을 가져옴
        Object[] args = proceedingJoinPoint.getArgs(); // 메서드에 전달된 인자들을 가져옴
        StringBuilder logMessage = new StringBuilder("@Around (Before) 현재 호출된 메서드명 : " + methodName + " 호출된 인자들 : ");
        
        for (Object arg : args) {
        	// 각 인자를 로그 메시지에 추가
            logMessage.append(arg).append(", ");
        }
        
        // 로그 메시지 출력
        System.out.println(logMessage.toString());
        System.out.println();
        
        // 메서드 실행
        Object result = proceedingJoinPoint.proceed();
        
        // After 부분 - 대상 메서드 실행 후 실행됨
        System.out.println("@Around (After) 메서드 명 : " + methodName + " 실행이 완료되었습니다.");
        System.out.println();
        
        // 결과 반환
        return result; // 대상 메서드의 결과를 반환
    }
    
	 */
}

	
