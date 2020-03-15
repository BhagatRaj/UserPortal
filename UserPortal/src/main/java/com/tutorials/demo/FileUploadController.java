package com.tutorials.demo;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tutorials.FileUploadService.FileUploadService;

@Controller

@RequestMapping("fileUploadController")
public class FileUploadController {
	
	
	
	@Autowired
	FileUploadService uploadService; 
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView singleFileUpload(@RequestParam("file") MultipartFile file,
                                   RedirectAttributes redirectAttributes) {

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
            return new ModelAndView("uploadExcelData","message", "Please select a file to upload");
        }

        try {

            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            Path path = Paths.get("C://temp//" + file.getOriginalFilename());
            Files.write(path, bytes);
            
            uploadService.uploadFileData("C://temp//"+path.getFileName());

            redirectAttributes.addFlashAttribute("message", 
                        "You successfully uploaded '" + file.getOriginalFilename() + "'");

        } catch (IOException e) {
        	redirectAttributes.addFlashAttribute("message", 
                    "Failure occured during upload '" + file.getOriginalFilename() + "'");
            e.printStackTrace();
        }

		
        return new ModelAndView("creditDetailsTabs","message", "You successfully uploaded '" + file.getOriginalFilename() + "'");
    }

}