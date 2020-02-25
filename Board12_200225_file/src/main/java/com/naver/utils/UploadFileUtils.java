package com.naver.utils;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class UploadFileUtils {

	public static String uploadFile(String uploadPath, MultipartFile file) throws IOException {

		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + file.getOriginalFilename();
		// 나중에는 getOriginalFilename 만 보여줘야 한다. "_" 얘는 구분자 오리지날과 uuid랜덤값을 구분하여 알아보기 편하게
		// 한다.

		String savedPath = calcPath(uploadPath);

		System.out.println("1._ " + uploadPath);
		System.out.println("2._ " + savedPath);
		System.out.println("3._ " + uploadPath + savedPath);
		System.out.println("4._ " + savedName);

		File target = new File(uploadPath + savedPath, savedName);

		FileCopyUtils.copy(file.getBytes(), target); // 타겟에 업로드패쓰에 있는 파일을 카피 하는역할.
		// 파일의 크기를 지정 , 타겟에는 기존에 저장되어있는 이름과 원본 파일의 경로가 담겨 있다.
		return "hello";
	}

	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance(); // 날짜 정보를 가져 오는객체..

		String yearPath = File.separator + cal.get(Calendar.YEAR); // 연도 정보를 가져온다
		// 파일 구분자를 넣어주기 위해 File.separator + 코드 실행 c:\\upload\\2020

//		String monthPath = yearPath + File.separator +(cal.get(Calendar.MONTH)+1);	// 월정보를 가져 온다.
//		c:\\upload\\2020\\2  이렇게 된다..   Calendar 에서 month 는 1월이 아니라 0월부터 시작되기에 +1 해주어야 한다.

		int month = (cal.get(Calendar.MONTH) + 1);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(month);
		// format(month) 데이터를 넣으면 DecimalFormat("00") 이러한 형태로 만들어 주겠다.. 이후 yearPath + \\

		int date = cal.get(Calendar.DATE);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(date);
//									c:\\upload\\2020\\02\\25  이러한 구조로 완성!
		System.out.println(":::::::::::::::::::::::" + datePath);

		makeDir(uploadPath, yearPath, monthPath, datePath); // 폴더를 만들어준다..

		return datePath; // 만들어진 폴더에 경로를 넣어 준다..

	}

	private static void makeDir(String uploadPath, String... arr) {
		if (new File(uploadPath + arr[arr.length - 1]).exists()) {
			return; // 여기에서의 return은 폴더가 있으면 빠져나가라는 의미
		}
		for (String path : arr) {
			File f = new File(uploadPath + path);
			if (!f.exists()) {
				f.mkdir();
			}
		}
	}
}
