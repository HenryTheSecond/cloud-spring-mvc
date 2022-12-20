package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class TranslateHistory {
  
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  
  @Column(columnDefinition = "NVARCHAR(MAX)")
  private String content;

  @Column(columnDefinition = "NVARCHAR(MAX)")
  private String translatedContent;
}
