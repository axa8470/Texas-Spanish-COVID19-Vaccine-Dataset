# Texas-Spanish-dataset
The dataset for the paper "Spanish Facebook Posts as an Indicator of COVID-19 Vaccine Hesitancy in Texas". The link to the paper: https://www.mdpi.com/2076-393X/10/10/1713.

Data collection in this study was performed by using CrowdTangle (https://www.crowdtangle.com/). Therefore, in this repository, there is a txt file that contains all the unique Facebook public pages whose posts were obtained in the data collection process. More details on how the posts were collected are below. 

The keyword-related posts were obtained for the entire year of 2021 by selecting the top 20 Texas counties with the highest number of COVID-19 cases in December 2021. In more detail, a single search was performed by choosing Spanish posts based on the created set of keywords shared within the pages associated with one of the counties. Then, the obtained posts were marked as belonging to that one specific county. This process was repeated 20 times (corresponding to the number of counties selected for the analysis).

Eight counties yielded a very low number of posts, and they were excluded from the analysis. Only counties with at least 100 posts were included, leaving a total of 12 counties and 25,314 Spanish Facebook posts. The study includes Harris, Dallas, Tarrant, Bexar, Travis, El Paso, Fort Bend, Hidalgo, Lubbock, Webb, Cameron, and Nueces.

In order to replicate our full dataset, our list of keywords, time range, language, and location will have to be inserted into CrowdTangle by also adding the list of public pages provided in this repository.

List of keywords used is the following: 
Vacunar covid, vacunar coronavirus, vacuna covid, vacuna coronavirus, vacunacion covid, vacunacion coronavirus, vacunadas covid, vacunadas coronavirus, vacunado covid, vacunado coronavirus, inyeccion, vacunarse, hidroxicloroquina, segunda dosis, primera dosis, aguja covid, dolor sitio covid, efecto secundario covid, moderna, astrazeneca, johnson&johnson, j&j, pfizer, sputnik.

If you are using this dataset, please cite our paper.

