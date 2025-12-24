package com.ritik.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ImageUploadResponse {
    private String publicId;
    private String url;
    private String secureUrl;
    private String format;
    private Long size;
    private Integer width;
    private Integer height;
    private String originalFilename;
    private String message;
}