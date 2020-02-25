package com.naver.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component	//스프링 컨테이너가 관리하여 빈으로 만들어주도록 하는 어노테이션
@Aspect		//aop에서 사용되는 어드바이스 임을 알려줘야 한다.
public class TestAdvice {
	
	
	@Before("execution(* com.naver.service.TestService*.*(..))") 	//	타깃의 포인트컷 앞에다가 실행되도록 하겠다..
	public void start() {
		System.out.println("::::::::::::::start:::::::::::::");
		
		System.out.println("::::::::::::::start:::::::::::::");
	}
	
	@After("execution(* com.naver.service.TestService*.*(..))") 	//	타깃의 포인트컷 뒤에다가 실행되도록 하겠다..
	public void end(JoinPoint jp) {
		System.out.println("::::::::::::::end:::::::::::::");
		
		System.out.println("::::::::::::::end:::::::::::::");
		
		System.out.println(jp.getKind()); //jp.getKind() //어드바이스 타입이 뭔지
		System.out.println(jp.getTarget());					//어드바이스 타겟이 뭔지
		System.out.println(jp.getThis());		
		Object[] args = jp.getArgs();
		System.out.println(Arrays.toString(args));
	}
	
	
	@Around("execution(* com.naver.service.TestService*.*(..))") 	//	타깃의 포인트컷 앞에다가 실행되도록 하겠다..
	public Object around(ProceedingJoinPoint pjp) throws Throwable {
		
		long start = System.currentTimeMillis();
		Object obj = pjp.proceed();
		
		long end = System.currentTimeMillis();
		System.out.println("#############################");
		System.out.println(end-start);
		System.out.println("#############################");
		return obj;
	}
}
