# gold-standard-toxicity
**Gold Standard for Toxicity and Incivility Project** \
**Annotated Data in Spanish for Toxicity and Insults in Digital Social Networks**

[![Coverage](https://raw.githubusercontent.com/training-datalab/gold-standard-toxicity/main/badges/coverage_65.svg)](https://github.com/training-datalab/gold-standard-toxicity/tree/main/data/raw) [![Version](https://raw.githubusercontent.com/training-datalab/gold-standard-toxicity/main/badges/v_0_3_3.svg)](CHANGELOG.md) [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://raw.githubusercontent.com/training-datalab/gold-standard-toxicity/master/badges/active.svg)](STATUS.md) [![DOI](https://raw.githubusercontent.com/training-datalab/gold-standard-toxicity/main/badges/doi.svg)](https://zenodo.org/doi/10.5281/zenodo.12574288) [![License](https://raw.githubusercontent.com/training-datalab/gold-standard-toxicity/main/badges/gnu.svg)](LICENSE-GPL.md) [![License](https://raw.githubusercontent.com/training-datalab/gold-standard-toxicity/main/badges/cc_by_4_0.svg)](LICENSE-CC.md) [![Raspberry](https://raw.githubusercontent.com/training-datalab/gold-standard-toxicity/main/badges/rpi5.svg)](https://www.raspberrypi.com/) [![tDL](https://raw.githubusercontent.com/training-datalab/gold-standard-toxicity/main/badges/tDL.svg)](https://training-datalab.com/)

## Overview

This repository contains data sets and materials for a gold standard elaboration on toxicity and incivility in the digital sphere based on human coding to benchmark algorithmic classification tasks with transformers and LLMs. **The labelling progress is indicated in the coverage badge above**.

We are labelling two samples of novel datasets of political digital interactions on Twitter (rebranded as X). The first set comprises almost 5 million data points from three Latin American protest events: (a) protests against the coronavirus and judicial reform measures in Argentina during August 2020; (b) protests against education budget cuts in Brazil in May 2019; and (c) the social outburst in Chile stemming from protests against the underground fare hike in October 2019. We are focusing on interactions in Spanish to elaborate a gold standard for digital interactions in this language, therefore, we prioritise Argentinian and Chilean data. The second set contains more than 31 million messages and more than 9 million interactions between 2010 and 2022, covering the election of members of the first Constitutional Convention in Chile, the drafting process and the referendum in which the proposal was rejected.

This project is generously funded by the **OpenAI Academic Programme**, **2024 FAE-UDP Research Grant**, and partially by the **St Hilda’s College Muriel Wise Fund at the University of Oxford**. The [**Training Data Lab**](https://training-datalab.com/) research group also logistically supports this project.

## Coding Process

Our samples are balanced considering a probability score from one of our main classification tasks using BERT family models already applied to the full corpora. This baseline classification implied more than 5,400 hours of computing.

The protest data was completely classified locally on a Raspberry Pi 5, while 41% of the batches of Convention data were classified there, and the rest were run on the cloud. **This allowed us to reduce the carbon footprint of our computational tasks by around 39%.**

Once we finish the labelling process, we will benchmark human coding with this classification and additional transformers and LLMs in the framework of different ongoing works.

### Protest Events Sample

| Case                |   Toxicity   | Batch  | Sample | Oversample | Oversampled |      Labelbox      | Priority |
| ------------------- | :----------: | :----: | :----: | :--------: | :---------: | :----------------: | :------: |
| Argentinan protests | 0.00 to 0.20 | ARG_Q1 |  100   |     20     |      0      | :white_check_mark: |    2     |
| Argentinan protests | 0.21 to 0.40 | ARG_Q2 |  100   |     20     |      1      | :white_check_mark: |    3     |
| Argentinan protests | 0.41 to 0.60 | ARG_Q3 |  100   |     20     |      3      | :white_check_mark: |    4     |
| Argentinan protests | 0.61 to 0.80 | ARG_Q4 |  100   |     20     |      0      | :white_check_mark: |    3     |
| Argentinan protests | 0.81 to 1.00 | ARG_Q5 |  100   |     20     |      3      | :white_check_mark: |    2     |
| Chilean protests    | 0.00 to 0.20 | CHL_Q1 |  100   |     20     |      1      | :white_check_mark: |    1     |
| Chilean protests    | 0.21 to 0.40 | CHL_Q2 |  100   |     20     |      0      | :white_check_mark: |    2     |
| Chilean protests    | 0.41 to 0.60 | CHL_Q3 |  100   |     20     |      2      | :white_check_mark: |    3     |
| Chilean protests    | 0.61 to 0.80 | CHL_Q4 |  100   |     20     |      1      | :white_check_mark: |    2     |
| Chilean protests    | 0.81 to 1.00 | CHL_Q5 |  100   |     20     |      3      | :white_check_mark: |    1     |
|                     |              | Total  | 1,000  |    200     |     14      |                    |          |

### Chilean Constitutional Convention

| Case                      |   Toxicity   | Batch  | Sample | Oversample | Oversampled |      Labelbox      | Priority |
| ------------------------- | :----------: | :----: | :----: | :--------: | :---------: | :----------------: | :------: |
| Constitutional Convention | 0.00 to 0.20 | CON_Q1 |  200   |     40     |      1      | :white_check_mark: |    3     |
| Constitutional Convention | 0.21 to 0.40 | CON_Q2 |  200   |     40     |      0      | :white_check_mark: |    4     |
| Constitutional Convention | 0.41 to 0.60 | CON_Q3 |  200   |     40     |      0      | :white_check_mark: |    5     |
| Constitutional Convention | 0.61 to 0.80 | CON_Q4 |  200   |     40     |      0      | :white_check_mark: |    4     |
| Constitutional Convention | 0.81 to 1.00 | CON_Q5 |  200   |     40     |      0      | :white_check_mark: |    3     |
|                           |              | Total  | 1,000  |    200     |      1      |                    |          |

## Preservation

These data sets are stored with version control on this GitHub repository. Furthermore, a Digital Object Identifier will provided by Zenodo.

## Storage and Backup

This GitHub repository has controlled access with Two-Factor Authentication `2FA` with physical USB security devices and/or mobile applications. Both issue one-time passwords to generate a cryptographic authentication `FIDO2` and `U2F`.

Moreover, the repository is backed up locally on a Directed Attached Storage HDD NVMe enclosure that supports `RAID 1` for two ATA-150 disks of 8TB mirroring.

## License

The content of this project itself is licensed under a [Creative Commons Attribution 4.0 International license (CC BY 4.0)](LICENSE-CC.md), and the underlying code used to format and display that content is licensed under a [GNU GPLv3 license](LICENSE-GPL.md).

The above implies that the data sets may be shared, reused, and adapted as long as appropriate acknowledgement is given. In addition, the code may be shared, reused, and adapted as long as the source is disclosed, the changes are stated, and the same [GNU GPLv3 license](LICENSE-GPL.md) is used.

## Contribute

Contributions are entirely welcome. You just need to [open an issue](https://github.com/training-datalab/gold-standard-toxicity/issues/new) with your comment or idea.

For more substantial contributions, please fork this repository and make changes. Pull requests are also welcome.

Please read our [code of conduct](CODE_OF_CONDUCT.md) first. Minor contributions will be acknowledged, and significant ones will be considered in our contributor roles taxonomy.

## Citation

González-Bustamante, B., & Rivera, S. (2024). Annotated Data in Spanish for Toxicity and Insults in Digital Social Networks. Dataset, pre-release version 0.3.3 -- Purple Butterfly. Leiden University, Universidad Diego Portales, University of California Irvine and Training Data Lab. https://zenodo.org/doi/10.5281/zenodo.12574288.

## Authors

Bastián González-Bustamante \
b.a.gonzalez.bustamante@fgga.leidenuniv.nl \
[ORCID iD 0000-0003-1510-6820](https://orcid.org/0000-0003-1510-6820) \
https://bgonzalezbustamante.com

Sebastián Rivera \
sebastian.rivera@uci.edu \
[ORCID iD 0000-0003-2642-2546](https://orcid.org/0000-0003-2642-2546) \
https://sebastianrivera.cl

## CRediT - Contributor Roles Taxonomy

Bastián González-Bustamante ([ORCID iD 0000-0003-1510-6820](https://orcid.org/0000-0003-1510-6820)): Conceptualisation, data curation, formal analysis, funding acquisition, investigation, methodology, project administration, resources, software, supervision, and validation.

Sebastián Rivera [(ORCID iD 0000-0003-2642-2546)](https://orcid.org/0000-0003-2642-2546): Conceptualisation, data curation, resources, supervision, and validation.

Carla Cisternas ([ORCID iD 0000-0001-7948-6194](https://orcid.org/0000-0001-7948-6194)): Investigation, resources and supervision.

Jaquelin Morillo ([ORCID iD 0000-0002-2870-2691](https://orcid.org/0000-0002-2870-2691)): Investigation and resources.

Diego Aguilar ([ORCID iD 0000-0003-4531-5922](https://orcid.org/0000-0003-4531-5922)): Investigation and resources.

Sofía Carrerá-Martínez ([ORCID iD 0009-0001-1596-115X](https://orcid.org/0009-0001-1596-115X)): Investigation and resources.
