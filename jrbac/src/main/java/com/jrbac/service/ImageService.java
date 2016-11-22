package com.jrbac.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.jrbac.util.UUIDGenerator;

import net.coobird.thumbnailator.Thumbnails;

public class ImageService {
	private static final Logger logger = LoggerFactory.getLogger(ImageService.class);

	/**
	 * @param request
	 * @param file
	 * @param uploadPath
	 *            形如这样的/assets/upload/image/
	 * @return /assets/upload/image/abc.jpg
	 * @throws IOException
	 */
	public static String saveImage(HttpServletRequest request, MultipartFile file, String uploadPath) {
		// 如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\uploadPath\\文件夹中
		// String fileName = file.getOriginalFilename();
		// String fileExt[] = fileName.split("\\.");
		String ext = file.getContentType().split("\\/")[1];
		String newFileName = UUIDGenerator.getUUID() + "." + ext;
		String realPath = request.getSession().getServletContext().getRealPath(uploadPath);
		String filePathAndName = null;
		if (realPath.endsWith(File.separator)) {
			filePathAndName = realPath + newFileName;
		} else {
			filePathAndName = realPath + File.separator + newFileName;
		}
		logger.info("-----上传的文件:{}-----", filePathAndName);
		try {
			// 先把文件保存到本地
			FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realPath, newFileName));
		} catch (IOException e1) {
			logger.error("-----文件保存到本地发生异常:{}-----", e1.getMessage());
		}
		int big = 2 * 1024 * 1024; // 2M以上就进行0.6压缩
		if (file.getSize() > big) {
			thumbnail(filePathAndName, 0.6f);
		} else {
			thumbnail(filePathAndName, 0.8f);
		}
		return uploadPath + newFileName;
	}

	public static boolean deleteFile(HttpServletRequest request, String filePath) {

		String realPath = request.getSession().getServletContext().getRealPath(filePath);
		logger.info("-----要删除文件的路径:{}-----", realPath);
		File file = new File(realPath);
		try {
			FileUtils.forceDelete(file);
			return true;
		} catch (IOException e) {
			logger.info("-----删除图片发生异常:{}-----", e.getMessage());
			return false;
		}

	}

	private static void thumbnail(String filePathAndName, double size) {
		try {
			Thumbnails.of(filePathAndName).scale(size).toFile(filePathAndName);
		} catch (IOException e) {
			logger.error("-----读取图片发生异常:{}-----", e.getMessage());
			logger.info("-----尝试cmyk转化-----");
			File cmykJPEGFile = new File(filePathAndName);
			try {
				BufferedImage image = ImageIO.read(cmykJPEGFile);
				ImageOutputStream output = ImageIO.createImageOutputStream(cmykJPEGFile);
				if (!ImageIO.write(image, "jpg", output)) {
					logger.info("-----cmyk转化异常:{}-----");
				}
				Thumbnails.of(image).scale(0.4f).toFile(filePathAndName);
				logger.info("-----cmyk转化成功-----");
			} catch (IOException e1) {
				logger.info("-----cmyk转化异常:{}-----", e1.getMessage());
			}
		}
	}

}
