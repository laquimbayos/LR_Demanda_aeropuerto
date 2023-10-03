# LR_Demanda_aeropuerto
Proyecto ejemplo de aplicación de regresión lienal al estimar con regresión multiple la demanda de carga en los aeropuestos de colombia.


# Proyecto de Estimación de Demanda de Transporte Aéreo en Colombia

Este repositorio contiene un básico análisis de series históricas para estimar la demanda futura de transporte aéreo en Colombia. Se utilizaron datos de la página de Aerocivil correspondientes al año 2019 y se realizaron dos enfoques diferentes para la estimación de la demanda.

## Descripción del Problema

La demanda de transporte aéreo es una variable crítica para la planificación y operación de aeropuertos en Colombia. En este proyecto, se aborda la estimación de la demanda futura utilizando dos enfoques distintos:

### Extrapolación Lineal de Series de Datos Históricos

En este primer enfoque, se realizó una extrapolación lineal de la serie histórica de datos de la "Demanda de carga nacional en kilogramos (Kg)" en los aeropuertos nacionales de Colombia. Los datos utilizados abarcan desde enero de 2014 hasta diciembre de 2019.

La ecuación de extrapolación lineal obtenida es:

DemandaKGN = 14,239,209 + 8,391 * t


Donde `DemandaKGN` representa la demanda de carga nacional en kilogramos y `t` es el tiempo en meses.

El resultado de esta extrapolación sugiere que la demanda aumentará en 8,391 kilogramos por mes. Se proyecta que la demanda anual de transporte aéreo de carga nacional en kilogramos para el año 2031 es de 192,066,628 kilogramos, con predicciones mensuales detalladas.

### Modelo de Regresión Lineal con Variable Exógena

En el segundo enfoque, se construyó un modelo de regresión lineal utilizando como variable exógena el precio internacional de los contratos futuros del combustible de avión Queroseno en yenes japoneses. Esta elección se basa en la suposición de que el precio del combustible podría influir en la demanda de transporte aéreo de carga a nivel nacional.

El análisis incluyó:

- Visualización de la relación entre la demanda y el precio del queroseno.
- Pruebas de correlación de Pearson y Spearman para confirmar la relación negativa entre ambas variables.
- Estimación de un modelo de regresión lineal simple.

La ecuación del modelo de regresión lineal resultante es:

DemandaKGN = 17,272,600 - 47.52 * PrecioQuerosenoJPY


Esto significa que un aumento de una unidad en el precio del queroseno en yenes japoneses se traduce en una disminución de 47.52 kilogramos en la demanda nacional de transporte aéreo de carga en kilogramos.

Para proyectar la demanda para el año 2031, se extrapoló el precio del queroseno en yenes japoneses y se obtuvieron los valores proyectados de la demanda mensual. La demanda anual proyectada para 2031 es de 181,513,909 kilogramos.

## Estructura del Repositorio

El repositorio está organizado de la siguiente manera:

- `data/`: Contiene los datos utilizados para el análisis.
- `notebooks/`: Contiene los cuadernos de Jupyter utilizados para el análisis de datos y la creación de modelos.
- `results/`: Contiene los resultados y gráficos generados durante el análisis.
- `docs/`: Documentación adicional relacionada con el proyecto.

Si desea explorar más detalles sobre el análisis y los resultados, consulte los cuadernos en la carpeta `notebooks`.

## Referencias

- Datos de demanda proporcionados por la web de la Aerocivil de Colombia.
- Serie de tiempo del precio de los contratos futuros de queroseno: [Investing.com](https://es.investing.com/commodities/tocom-kerosene-futures).

---

**Nota**: Este proyecto se realizó con fines académicos y de investigación. Los resultados y las proyecciones presentadas deben tomarse como estimaciones basadas en los datos disponibles y no deben considerarse como predicciones precisas de la demanda futura.









