package com.university.service;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


@Service
public class FileService {
	private static final Logger log = LoggerFactory.getLogger(FileService.class);

	public String uploadFile(String uploadPath, String originalFileName, byte[] fileData) throws Exception {
		UUID uuid = UUID.randomUUID();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		String savedFileName = uuid.toString() + extension;
		String fileUploadFullUrl = uploadPath + "/" + savedFileName;
		FileOutputStream fos = new FileOutputStream(fileUploadFullUrl);
		fos.write(fileData);
		fos.close();
		return savedFileName;
	}

	public void deleteFile(String filePath) throws Exception {
		File deleteFile = new File(filePath);
		if (deleteFile.exists()) {
			deleteFile.delete();
			log.info("파일삭제완료");
		} else {
			log.info("파일 존재하지 않음");
		}
	}
}
