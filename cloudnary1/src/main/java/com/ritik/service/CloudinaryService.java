package com.ritik.service;


import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ritik.dto.ImageUploadResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class CloudinaryService {

    private final Cloudinary cloudinary=null;

    public ImageUploadResponse uploadImage(MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            throw new IllegalArgumentException("File is empty");
        }

        // Validate file type
        String contentType = file.getContentType();
        if (contentType == null || !contentType.startsWith("image/")) {
            throw new IllegalArgumentException("File must be an image");
        }

        log.info("Uploading image: {} (size: {} bytes)", file.getOriginalFilename(), file.getSize());

        // Generate unique public ID
        String publicId = "uploads/" + UUID.randomUUID().toString();

        // Upload to Cloudinary
        Map uploadParams = ObjectUtils.asMap(
                "public_id", publicId,
                "folder", "spring-boot-uploads",
                "resource_type", "image",
                "overwrite", false,
                "transformation", new com.cloudinary.Transformation()
                        .quality("auto")
                        .fetchFormat("auto")
        );

        Map uploadResult = cloudinary.uploader().upload(file.getBytes(), uploadParams);

        log.info("Image uploaded successfully: {}", uploadResult.get("public_id"));

        // Build response
        return ImageUploadResponse.builder()
                .publicId((String) uploadResult.get("public_id"))
                .url((String) uploadResult.get("url"))
                .secureUrl((String) uploadResult.get("secure_url"))
                .format((String) uploadResult.get("format"))
                .size(((Number) uploadResult.get("bytes")).longValue())
                .width((Integer) uploadResult.get("width"))
                .height((Integer) uploadResult.get("height"))
                .originalFilename(file.getOriginalFilename())
                .message("Image uploaded successfully")
                .build();
    }

    public boolean deleteImage(String publicId) throws IOException {
        log.info("Deleting image: {}", publicId);
        
        Map result = cloudinary.uploader().destroy(publicId, ObjectUtils.emptyMap());
        String resultStatus = (String) result.get("result");
        
        boolean deleted = "ok".equals(resultStatus);
        log.info("Image deletion result: {}", resultStatus);
        
        return deleted;
    }

    public String getImageUrl(String publicId, int width, int height) {
        return cloudinary.url()
                .transformation(new com.cloudinary.Transformation()
                        .width(width)
                        .height(height)
                        .crop("fill")
                        .gravity("auto"))
                .generate(publicId);
    }
}
