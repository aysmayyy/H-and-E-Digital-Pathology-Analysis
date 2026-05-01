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

### 4. Supervised Classification GUI
* **Discriminant Analysis:** The project includes a `Classify_RGB_Image.m` tool. This allows researchers to manually "train" the system by labeling sample pixels, which the algorithm then uses to classify the rest of the tissue based on statistical probability.



## 📂 Repository Structure

* **`AnalyzePathology.m`**: The primary execution script. Run this to process images and generate scoring reports.
* **`TissueSegmenter.m`**: A consolidated logic center containing all L*a*b* thresholds for different biological components (Blood, Nuclei, Alveoli, etc.).
* **`Deconvolution.m`**: The core mathematical engine for stain unmixing.
* **`Classify_RGB_Image.m`**: An interactive tool for complex slides requiring manual supervised classification.
* **`Normalize.m`**: Standardizes image intensity and brightness across different tissue batches.

## 🧪 Staining Calibration
Histopathology slides often suffer from "batch effects" where staining intensity varies. This pipeline is built with a **Calibration Mode**:
* Users can pass custom threshold limits into `TissueSegmenter.m` to account for specific batch variations without modifying the underlying logic.

## 🚀 How to Use the Pipeline

### 1. Prerequisites
Ensure you have **MATLAB** installed along with the following toolboxes:
* **Image Processing Toolbox**
* **Statistics and Machine Learning Toolbox** (required for `Classify_RGB_Image.m`)

### 2. Setup
1. Clone this repository or download the four `.m` files into a single folder.
2. Place your image files (e.g., `.png`, `.tif`, or `.jpg`) in that same folder.

### 3. Running Automated Analysis
1. Open `AnalyzePathology.m` in MATLAB.
2. Update the `img_name` variable at the top of the script to match your filename:
   ```matlab
   I = imread('your_image_name.png');
Press Run. The results will print to the Command Window, and a figure will appear showing the segmentation masks.

### 4. Interactive Classification (Optional)
If a slide is uniquely stained or difficult to segment automatically:
1. Run `Classify_RGB_Image.m`.
2. Follow the on-screen prompts to select an image and label sample pixels.

## 📜 License
This project is licensed under the **MIT License**.

**Scientific Credit:** Stain vectors used in deconvolution are derived from *"Quantification of histochemical staining by color deconvolution"* (Ruifrok et al.).
