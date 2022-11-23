
Analizando la realidad
======================

Nos encontramos en una época donde estamos muy cerca de cumplir todos los postulados de la computación ubicua que proponía Weiser (1991). Gracias a la Internet de la Cosas (Internet of Things - IoT) en los próximos años asistiremos a la aparición de una explosión de objetos de la vida cotidiana a los que se incorpara capacidad computo y de comunicación a través de Internet.

De momento, si podemos hablar que disponemos de computación y conectividad en cualquier lugar y cualquier momento gracias a los teléfonos inteligentes. Es más, nuestra actividad diaria está siendo continuamente monitorizada, a veces sin ser plenamente conscientes, a través de múltiples dispositivos y sensores tanto propios como ajenos. El resultado es que vamos dejando una huella digital dispersa en múltiples bases de datos, pero lo suficiente rica como para realizar análisis interesantes incluso empleando cada base de datos de manera individual. El proceso de analizar esta huella digital se conoce como minería de la realidad (*reality mining*).

A la disponibilidad de la huella digital, hay que añadir las capacidades de análisis que nos aportan la ciencia de datos que combina tecnologías que permiten analizar grandes volúmenes de datos, heterogéneos y en tiempo real si fuera necesario (*Big Data*), con algoritmo de aprendizaje automático (*machine learning*) que permiten encontrar patrones ocultos en los datos.

Hay que considerar, también, que toda nuestra actividad la realizamos en entorno social (MIT Human Dynamics Lab), donde nos nuestra posición y contexto, la informaciín y las ideas a las que estamos expuestos, nos condiciona nuestro comportamiento y las decisiones que tomamos (Pentland, 2014).

Práctica taxis de Nueva York
----------------------------

Esta práctica tiene como objetivo introducir el análisis de datos a partir de la traza digital que dejan los taxis de la ciudad de Nueva York. La organización TLC (Taxi and Limousine Commission) promovió en 2014 a través de [Taxicab Passenger Enhancements Project (TPEP)](http://www.nyc.gov/html/tlc/html/industry/taxicab_serv_enh_archive.shtml) que todos los taxis tenían que incorporar tecnologia que mejoraran la calidad del servicio. Entre estas tecnologías se encuentra la recolección automática de datos sobre cada viaje entre los que se incluyen el punto de recogida, el de bajada y la tarifa del viaje. Esta organización pone a disposición pública datos de los trayectos en los diferentes tipos de taxi de la ciudad de Nueva York desde el año 2009. Se analizaran los viajes realizados durante un día del año 2013 buscando responder preguntas relativas a la movilidad de los habitantes de Nueva York que impactan en el servicio de taxi.

### Descargar los archivos de la práctica

Primeramente debemos realizar una clonación del repositorio que contiene todos los archivos que conforman la práctica. Desde un directorio vacío ejecutamos el siguiente comando:

    git clone https://github.com/phaya/real-life-analytics.git

creándose un directorio `real-life-analytics`.

Este directorio contiene el archivo `nyc_taxi.Rmd` que es un *notebook* que incluye el código del cual se parte para realizar la práctica, así como las preguntas que hay que responder. El resultado que se espera es un *notebook* similar en el cual el alumno ha tenido que completar aquellas partes del código incompletas, así como responder a las preguntas planteadas.

También se encuentra el archivo `nyc_taxi.sol.html` que es un ejemplo mínimo del resultado que se genera mediante [RStudio](https://www.rstudio.com/), y que puede ayudar en caso de atascarse durante la realizaciónd de la práctica.

### Instalación

El código de la práctica ha sido probado con R version 3.3.2 (2016-10-31) y RStudio 1.2.240.

Es preciso instalar los siguientes paquetes si no estuvieran disponibles:

``` r
install.packages("tidyverse")
install.packages("cowplot")
install.packages("hexbin")
install.packages("lubridate")
install.packages("prettydoc")
install.packages("scales")
```

### Datasets

Los siguientes conjuntos de datos son necesarios para completar la práctica. Estos archivos hay que descargárselo por separado.

-   [Trayectos taxis](https://www.dropbox.com/s/3px4xtwb0z9r2n2/trip_data_2013-01-14.csv?dl=1): contiene todos los trayectos en Taxi realizados en la ciudad de Nueva York durante el día 14 de enero de 2013. El archivo pesa 73.4 MB
-   [Localizaciones Starbucks](https://www.dropbox.com/s/043ake4u0q6xe05/All_Starbucks_Locations_in_the_US_2013.csv?dl=1): contiene la coordenadas de los Starbucks que había en Nueva York en el año 2013. El archivo pesa 3.9 MB

Para saber más
--------------

La siguiente lista contiene enlaces de los que se han extraido información para elaborar esta práctica, y cuya lectura amplia las conclusiones que se hayan podido extraer de la misma.

-   [Taxicabs of New York City](https://en.wikipedia.org/wiki/Taxicabs_of_New_York_City)
-   [Exploration of NYC Taxi Data](http://hafen.github.io/taxi/)
-   [Analyzing 1.1 Billion NYC Taxi and Uber Trips, with a Vengeance](http://toddwschneider.com/posts/analyzing-1-1-billion-nyc-taxi-and-uber-trips-with-a-vengeance/)
-   [A Billion Taxi Rides on Google's BigQuery](http://tech.marksblogg.com/billion-nyc-taxi-rides-bigquery.html)
-   [NYC Taxi Trip and Fare Data Analytics using BigData](http://egr.uri.edu/wp-uploads/asee2016/42-150-1-DR.pdf)
-   [Public NYC Taxicab Database Lets You See How Celebrities Tip](http://gawker.com/the-public-nyc-taxicab-database-that-accidentally-track-1646724546)
-   [NYC Taxis: A Day in the Life](http://chriswhong.github.io/nyctaxi/)
-   [What Insights Do Taxi Rides Offer into FederalReserve Leakage?](https://research.chicagobooth.edu/-/media/research/stigler/pdfs/workingpapers/18whatinsightsdotaxiridesofferintofederalreserveleakage.pdf)
-   [Uber Is Taking Millions Of Manhattan Rides Away From Taxis](https://fivethirtyeight.com/features/uber-is-taking-millions-of-manhattan-rides-away-from-taxis/)
-   [Should I Stay or Should I Go? NYC Taxis at the Airport](http://chriswhong.com/open-data/should-i-stay-or-should-i-go-nyc-taxis-at-the-airport/)
-   [Predicting Taxi Tip-Rates in NYC](https://cseweb.ucsd.edu/~jmcauley/cse190/reports/sp15/050.pdf)
-   [Analysis and modeling of large-scale systems : taxis and social polling](https://purl.stanford.edu/bz752gf4249)

### Fuentes de datos Taxis y Starbucks

Los dos primeros enlaces están relacionados con el conjunto de datos utilizado en la práctica, siendo el segundo la página oficial desde donde se puede bajar los viajes en taxi desde 2009. El resto de las páginas contienen datos abiertos, y en particular, en Socrata es donde se ha conseguido la ubicación de los Starbucks que se emplea durante la práctica.

-   [Official TLC Trip Record Data](https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page)
-   [NYC Taxi Trips](http://www.andresmh.com/nyctaxitrips/)
-   [NYC Open Data](https://nycopendata.socrata.com/)
-   [Socrata](https://opendata.socrata.com)

### Más huella digital

Los siguiente enlaces incluyen conjuntos de datos con distinta huella digitla recogido en distintos proyectos de investigación. La primera página apunta al sitio Reality Commons que engloba cuatro proyectos distintos liderados por el citado Sandy Pentland. La segunda página referencia al desafio promovido por Orange de analizar registros de llamadas en paises en desarrollo.

-   [Reality Commons](http://%20realitycommons.media.mit.edu)
    -   Friends and Family
    -   Social Evolution
    -   Reality Mining
    -   Badge Data Set
-   [Data for Development](http://www.d4d.orange.com/en/Accueil)

Referencias
-----------

-   Weiser, Mark (1991). “The Computer for the 21st Century”. <http://www.ubiq.com/hypertext/weiser/SciAmDraft3.html>
-   Pentland, Alex (2014) "Social Physics: How Social Networks Can Make Us Smarter". Penguin Publishing Group
-   [MIT Human Dynamics Lab](https://www.media.mit.edu/groups/human-dynamics/overview/)
-   [Atlas of inequality](https://inequality.media.mit.edu/)
