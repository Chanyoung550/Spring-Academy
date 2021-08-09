package org.zerock.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UploadForm {
	String desc;
	MultipartFile[] uploadFile;
}