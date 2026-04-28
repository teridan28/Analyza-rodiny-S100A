# Nacteni dat
data <- read.table("counts.txt", header=TRUE, skip=1)
colnames(data)[7] <- "Counts"

# Vzorec: TPM = (Counts/Length) / sum(Counts/Length) * 1e6
# a. Vypocet RPK (Reads Per Kilobase)
data$rpk <- data$Counts / (data$Length / 1000)
# b. Normalizacni faktor
scaling_factor <- sum(data$rpk) / 1e6
# c. Finalni TPM
data$tpm <- data$rpk / scaling_factor

# Filtrace rodiny S100A a prirazeni HGNC ID
s100_subset <- data[grep("^S100A", data$Geneid), ]

# Prevod jmen genu na HGNC ID
hgnc_lookup <- data.frame(
  Symbol = c("S100A1", "S100A2", "S100A3", "S100A4", "S100A5", "S100A6", "S100A7", "S100A8", "S100A9", "S100A10", "S100A11", "S100A12", "S100A13", "S100A14", "S100A16", "S100A7A", "S100A15A", "S100A7L2"),
  HGNC_ID = c(10486, 10487, 10488, 10471, 10474, 10475, 10476, 10477, 10479, 10478, 10480, 10481, 10482, 10483, 14502, 30043, 30043, 31737))

# Propojeni dat s HGNC ID
vysledek <- merge(s100_subset[, c("Geneid", "tpm")], hgnc_lookup, by.x = "Geneid", by.y = "Symbol")

# Finalni formatovani
finalni_tabulka <- vysledek[, c("HGNC_ID", "tpm")]
colnames(finalni_tabulka) <- c("HGNC_ID", "TPM")

# Serazeni podle exprese
finalni_tabulka <- finalni_tabulka[order(-finalni_tabulka$TPM), ]

# Export
print(finalni_tabulka)
write.csv(finalni_tabulka, "S100A_expression_TPM.csv", row.names = FALSE)
