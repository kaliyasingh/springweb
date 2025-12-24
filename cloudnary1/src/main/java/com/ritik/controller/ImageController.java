package com.ritik.controller;

import com.ritik.dto.ImageUploadResponse;
import com.ritik.service.CloudinaryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ImageController {

    // ✅ Let Spring inject this bean instead of manually creating it
    private final CloudinaryService cloudinaryService;

    // In-memory storage for demo purposes
    // In production, use a database
    private final List<ImageUploadResponse> uploadedImages = new ArrayList<>();

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("images", uploadedImages);
        model.addAttribute("imageCount", uploadedImages.size());
        return "index";
    }

    @PostMapping("/upload")
    public String uploadImage(@RequestParam("file") MultipartFile file,
                              RedirectAttributes redirectAttributes) {
        try {
            if (file.isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "Please select a file to upload");
                return "redirect:/";
            }

            log.info("Uploading file: {}", file.getOriginalFilename());

            ImageUploadResponse response = cloudinaryService.uploadImage(file);
            uploadedImages.add(0, response); // Add to beginning of list

            redirectAttributes.addFlashAttribute("success", "Image uploaded successfully!");
            redirectAttributes.addFlashAttribute("uploadedImage", response);

        } catch (IllegalArgumentException e) {
            log.error("Validation error: {}", e.getMessage());
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        } catch (IOException e) {
            log.error("Error uploading image", e);
            redirectAttributes.addFlashAttribute("error", "Failed to upload image: " + e.getMessage());
        } catch (Exception e) {
            log.error("Unexpected error", e);
            redirectAttributes.addFlashAttribute("error", "Unexpected error occurred");
        }

        return "redirect:/";
    }

    @PostMapping("/delete")
    public String deleteImage(@RequestParam("publicId") String publicId,
                              RedirectAttributes redirectAttributes) {
        try {
            log.info("Deleting image: {}", publicId);

            boolean deleted = cloudinaryService.deleteImage(publicId);

            if (deleted) {
                uploadedImages.removeIf(img -> img.getPublicId().equals(publicId));
                redirectAttributes.addFlashAttribute("success", "Image deleted successfully!");
            } else {
                redirectAttributes.addFlashAttribute("error", "Failed to delete image");
            }
        } catch (IOException e) {
            log.error("Error deleting image", e);
            redirectAttributes.addFlashAttribute("error", "Error deleting image: " + e.getMessage());
        }

        return "redirect:/";
    }

    // REST API Endpoints

    @PostMapping("/api/upload")
    @ResponseBody
    public ResponseEntity<?> uploadImageApi(@RequestParam("file") MultipartFile file) {
        try {
            if (file.isEmpty()) {
                Map<String, String> error = new HashMap<>();
                error.put("error", "File is empty");
                return ResponseEntity.badRequest().body(error);
            }

            ImageUploadResponse response = cloudinaryService.uploadImage(file);
            uploadedImages.add(0, response);

            return ResponseEntity.ok(response);

        } catch (IllegalArgumentException e) {
            log.error("Validation error: {}", e.getMessage());
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        } catch (IOException e) {
            log.error("Error uploading image", e);
            Map<String, String> error = new HashMap<>();
            error.put("error", "Failed to upload image");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(error);
        }
    }

    @GetMapping("/api/images")
    @ResponseBody
    public ResponseEntity<List<ImageUploadResponse>> getAllImages() {
        return ResponseEntity.ok(uploadedImages);
    }

    @DeleteMapping("/api/delete/{publicId:.+}")
    @ResponseBody
    public ResponseEntity<?> deleteImageApi(@PathVariable String publicId) {
        try {
            boolean deleted = cloudinaryService.deleteImage(publicId);

            if (deleted) {
                uploadedImages.removeIf(img -> img.getPublicId().equals(publicId));
                Map<String, String> response = new HashMap<>();
                response.put("message", "Image deleted successfully");
                return ResponseEntity.ok(response);
            } else {
                Map<String, String> error = new HashMap<>();
                error.put("error", "Image not found");
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(error);
            }
        } catch (IOException e) {
            log.error("Error deleting image", e);
            Map<String, String> error = new HashMap<>();
            error.put("error", "Failed to delete image");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(error);
        }
    }

    @GetMapping("/health")
    @ResponseBody
    public ResponseEntity<Map<String, String>> health() {
        Map<String, String> health = new HashMap<>();
        health.put("status", "UP");
        health.put("service", "Cloudinary Image Upload");
        return ResponseEntity.ok(health);
    }
}