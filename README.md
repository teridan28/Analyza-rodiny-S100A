# Analyza-rodiny-S100A
Analýza genu z rodiny S100A z BioProjectu PRJNA273802, vybrala jsem si run SRR1777112.  
Postup: 
1. Stažení dat pomocí `sra-toolkit`.
2. Mapování na referenční genom hg38 pomocí `hisat2`.
3. Kvantifikace pomocí `featureCounts`.
4. Výpočet TPM a filtrace v `R`.

Nejdříve je potřeba spustit ```pipeline.sh```, a poté ```analyza.R```

## Vizualizace výsledků v IGV

Obrázek detailu genu **S100A10**. Šedé bloky představují namapované ready na referenční genom hg38. Modré oblouky znázorňují místa sestřihu, kde byly z RNA vystřiženy introny.

![Vizualizace S100A10](S100A10.png)

*Komentář: V oblasti jsou patrné jasné exony s vysokým pokrytím, které přesně odpovídají anotaci genu. Přítomnost barevných variant v reads může indikovat nukleotidové neshody (SNP) v testovaném vzorku. To že jde o mutace je pravděpodobné s ohledem na původ vzorku z hepatocelularniho karcinomu. *
