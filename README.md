# RanSMAP: An Open Dataset of Ransomware Storage and Memory Access Patterns

## Purpose of the dataset

Although machine learning and deep learning have become essential components of today's security systems, the lack of a standard and realistic open dataset has made the development of such systems slower and harder. Our previous RanSAP dataset, which contained only low-level storage access patterns collected using a thin hypervisor, was used to create behavioral-based ransomware detectors; it provides an additional protection layer when the OS-level ransomware detection systems are compromised. The previous ransomware detector, which used only low-level storage access patterns, could not detect ransomware in some conditions, for example, when Office applications and web browsers were executed simultaneously. Therefore, we created this new open dataset containing storage and memory access patterns of ransomware and benign applications.

This repository provides our new open dataset named RanSMAP, which stands for Ransomware Storage and Memory Access Patterns. It contains low-level storage and memory access patterns collected using a thin hypervisor. The RanSMAP datasets consist of storage and memory access patterns of six ransomware samples and six benign applications, seven Conti ransomware variants, and simultaneous execution of ransomware with benign applications collected on the machines of four CPUs, two RAM generations, five RAM frequencies, and two RAM capacities.
This dataset can be used to examine the capability and limitations of low-level behavioral features obtained using a thin hypervisor in detecting ransomware.

## For more detail

You can read the following open-access paper for more details about the dataset.

- [1] M. Hirano and R. Kobayashi, "RanSMAP: Open Dataset of Ransomware Storage and Memory Access Patterns for Creating Deep Learning Based Ransomware Detectors." Computers & Security, 2024, 104202, ISSN 0167-4048, https://doi.org/10.1016/j.cose.2024.104202.

## Terms of use / License

When using this dataset in your research or other purpose, please cite the following two papers:

- [1] M. Hirano and R. Kobayashi, "RanSMAP: Open Dataset of Ransomware Storage and Memory Access Patterns for Creating Deep Learning Based Ransomware Detectors." Computers & Security, 2024, 104202, ISSN 0167-4048, https://doi.org/10.1016/j.cose.2024.104202.

- [2] M. Hirano and R. Kobayashi, "Machine Learning-based Ransomware Detection Using Low-level Memory Access Patterns Obtained From Live-forensic Hypervisor" In proceedings of 2022 IEEE International Conference on Cyber Security and Resilience (CSR), 2022, pp. 323-330, https://doi.org/10.1109/CSR54599.2022.9850340.

In addition to the above citations, you can use this dataset under the license in [Creative Commons Attribution-NoDerivatives 4.0 International (CC BY-ND 4.0)](https://creativecommons.org/licenses/by-nd/4.0/).

## Download

You can clone this repository or download the ZIP archive from the following Kaggle site:
https://www.kaggle.com/datasets/hiranomanabu/ransmap-2024-ransomware-behavioral-features/

## Contents
 
Some large CSV files are compressed in Zip; you can unzip all the files using unzip-all.sh. The following list is the output of list-contents.sh, which is contained in this repository.

```
===================
TOTAL:
===================
NUMBER OF CSV DIRECTORIES: ./dataset/
          360 extra
          100 mix
          1440 original
          70 variants
```

## CSV file format

Below, we provide a brief summary and examples of CSV file formats. For more detailed information about each column and its meaning, please read our paper [1].

- ata_read.csv

```
UNIX time in sec, UNIX time in ns, LBA, size, -1, 0
1683685461, 360640431,17672936,4096,-1,0
```
Note: We did not use the last two columns.

- ata_write.csv

```
UNIX time in sec, UNIX time in ns, LBA, size, entropy, 0
1683685461, 293367407,11067704,4096,0.008080546319218226,0
```
Note: We did not use the last column.

- mem_read.csv

```
UNIX time in sec, UNIX time in ns, GPA, 0, -1, type
1683685461, 48233682,4514638160,0,-1,2
```

- mem_write.csv

```
UNIX time in sec, UNIX time in ns, GPA, size, entropy, type
1683685461, 49817094,4508986760,4096,0.8293135151603572,2
```

- mem_readwrite.csv

```
UNIX time in sec, UNIX time in ns, GPA, size, entropy, type
1683685461, 67038181,19018287160,4096,0.7738966728994406,2
```

- mem_exec.csv

```
UNIX time in sec, UNIX time in ns, GPA, 0, -1, type
1683685461, 48310974,45988104,0,-1,2
```

## Frequency asked questions

### Q. What tool did you use for collecting storage and memory access patterns?

A. The tool we used to collect storage and memory access patterns is a type-I lightweight hypervisor named BitVisor. We created a surveillance function on BitVisor (although the function we developed has not been released yet, you can download and use the original BitVisor from https://github.com/matsu/bitvisor).

### Q. Is this dataset for dynamic or behavioral analysis?

A. Yes. We presented the results of behavioral analysis in our paper [1] based on storage and memory access patterns. We trained the deep learning model using storage and memory access patterns of ransomware samples collected on various hardware settings. 

### Q. What do "access patterns" mean?

A. We used the word "storage access patterns" to describe low-level input and output operations on storage devices (e.g., HDD/SSD). When the application runs on an OS, it calls the OS's filesystem API. The OS then requests input and output operations to the HDD/SSD via the device driver; it usually uses Direct Memory Access (DMA) to exchange information between the OS and the HDD/SSD. We created a surveillance function in the hypervisor layer that intercepts such DMA operations.

On the other hand, we used the word "memory access patterns" for the page-level memory accesses intercepted in the timings of Second Level Address Translation (SLAT); we created a surveillance function in the hypervisor layer that collects pege-level memory accesses using Intel's SLAT technology named Extended Page Table (EPT).

Please refer to our paper's detailed design and implementation [1].

### Q. How many hardware combinations did you use to collect ransomware access patterns?

A. We collected storage and memory access patterns on the four CPU models (two CPU generations, the different number of E-cores and P-cores), two generations of Double Data Rate (DDR) RAM modules, five RAM frequencies, two RAM capacities to examine the capacity and limitations of the low-level storage and memory access patterns in detecting ransomware. The detailed analysis is shown in our paper [1].
