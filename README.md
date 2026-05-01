# Automated H&E Histopathology Image Analysis Pipeline

## 🔬 Project Overview
This repository provides a comprehensive MATLAB toolbox for the automated analysis of Hematoxylin and Eosin (H&E) stained histopathology slides. The pipeline is specifically designed to quantify lung injury and tissue health by converting qualitative microscope observations into objective, reproducible numerical data.

The project bridges the gap between digital pathology and clinical research by automating the calculation of injury ratios, such as **Hemorrhage**, **Aeration**, and **Atelectasis (Tissue Collapse)**.

## 🛠️ Key Technical Features

### 1. Stain Deconvolution (Color Unmixing)
Utilizes **Optical Density (OD) Matrix Inversion** (based on the Beer-Lambert Law) to mathematically separate the Hematoxylin (nuclei) and Eosin (cytoplasm/connective tissue) channels. This allows for precise structural analysis even where stains overlap.

### 2. Robust L*a*b* Segmentation
Unlike standard RGB filtering, this pipeline operates in the **CIE L*a*b* color space**. This ensures that segmentation is based on true color perception and remains robust against variations in microscope lighting and brightness.

### 3. Automated Clinical Scoring
Implements "Silva Scoring" logic to automatically calculate:
* **Hemorrhage Ratio:** Extravasated red blood cells relative to healthy tissue.
* **Aeration Ratio:** Percentage of open alveolar space.
* **Atelectasis Score:** Quantitative measure of tissue density and alveolar collapse.

### 4. Machine Learning & GUI Tools
* **K-Means Clustering:** Includes unsupervised learning scripts to automatically group tissue types without manual thresholding.
* **Interactive Classifier:** A Discriminant Analysis GUI that allows researchers to "train" the system on custom slides.

## 📂 Repository Structure

* **`AnalyzePathology.m`**: The primary execution script. Run this to process images and generate scoring reports.
* **`TissueSegmenter.m`**: A consolidated logic center containing all L*a*b* thresholds for different biological components (Blood, Nuclei, Alveoli, etc.).
* **`Deconvolution.m`**: The core mathematical engine for stain unmixing.
* **`Classify_RGB_Image.m`**: An interactive tool for complex slides requiring manual supervised classification.
* **`Normalize.m`**: Standardizes image intensity and brightness across different tissue batches.

## 🧪 Staining Calibration
Histopathology slides often suffer from "batch effects" where staining intensity varies. This pipeline is built with a **Calibration Mode**:
* Users can pass custom threshold limits into `TissueSegmenter.m` to account for specific batch variations without modifying the underlying logic.

## 🚀 Usage
1. Place your `.png` or `.tif` slide images in the root directory.
2. Open `AnalyzePathology.m` and update the `img_name` variable.
3. Run the script to generate numerical data and visual validation plots.

## 📜 License
This project is licensed under the **MIT License**.

**Scientific Credit:** Stain vectors used in deconvolution are derived from *"Quantification of histochemical staining by color deconvolution"* (Ruifrok et al.).
