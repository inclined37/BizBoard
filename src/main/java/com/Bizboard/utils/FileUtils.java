package com.Bizboard.utils;

import java.io.File;
import java.util.UUID;

import org.springframework.util.StringUtils;

public class FileUtils {

    // UUID로 파일명 변경
    public static String generateStoredFilename(String originalFilename) {
        String extension = StringUtils.getFilenameExtension(originalFilename);
        String storedFilename = UUID.randomUUID().toString() + "." + extension;
        return storedFilename;
    }

    // 디렉토리 생성
    public static File createDirectory(String directoryPath) {
        File directory = new File(directoryPath);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        return directory;
    }

}
