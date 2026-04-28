# Analyza-rodiny-S100A
Analýza genu z rodiny S100A z BioProjectu PRJNA273802, vybrala jsem si run SRR1777112.  
Postup: 
1. Stažení dat pomocí `sra-toolkit`.
2. Mapování na referenční genom hg38 pomocí `hisat2`.
3. Kvantifikace pomocí `featureCounts`.
4. Výpočet TPM a filtrace v `R`.

Nejdříve je potřeba spustit ```pipeline.sh```, a poté ```analyza.R```
