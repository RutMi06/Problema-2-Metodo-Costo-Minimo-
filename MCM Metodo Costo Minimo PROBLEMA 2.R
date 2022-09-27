# Problema 2: 
# Se fabrica un producto en tres plantas y se envía a tres almacenes cuyos costos se muestran en la 
# siguiente tabla: 

# PLantas/Almacenes   A1     A2       A3  Capacidad Disponible 
#   P1 		            24	   26		    14          2300
#   P2 	              13	   20		    18          1500
#   P3                22	   28		    20          1100
#  Demanda           1200   2400    1300          4900

# Formule un modelo de programacion lineal que permita satisfacer las necesidades de todos los  
# almacenes al tiempo que minimice los costos asociados al transporte.

library(lpSolve)
# matriz de flete
costos<-matrix(c(24,13,22,26,20,28,14,18,20), nrow = 3) 
costos

#Símbolo de restricción de salida
row.signs <-rep ("<=", 3) 
row.signs

# Vector de restricción de salida
row.rhs <-c (2300,1500,1100) 
row.rhs

#Símbolo de restricción de ventas
col.signs <-rep ("=", 3) 
col.signs

# Vector de restricción de ventas
col.rhs <-c (1200,2400,1300) 
col.rhs

# Ejecutamos la función y se guarda el resultado en res
res<-lp.transport(costos,"min",row.signs,row.rhs,col.signs, col.rhs)

# Se muestra el resultado de la función 
# objetivo o el costo total mínimo
res

# Se muestra la tabla con los totales de envío
res$solution

