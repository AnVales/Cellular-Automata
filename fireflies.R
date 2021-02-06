# this script simulates coordination in flashing fire
# install.packages('plot.matrix')
library ('plot.matrix')

time<-50
th<-0.25
# que influenciable es cada luciernaga
# si es bajo, resetean siempre que tengan alguien al lado diferente
collist<-c(0,1)
# dos estados, 0 no emiten luz, 1 luciendo

sp<-matrix(0,15,15)
# matriz espacial
spm<-matrix(0,15,15)
# matriz que guarda el estado anterior


late<-round(runif(90 ,1,25))
# nos da numeros aleatorios (305) que van del 1 al 25
lon<-round(runif(90 ,1,25))
coords <- cbind (c(late),c(lon))
# a trick to pass the coordinates
sp[coords]<-1
# nos pone 1 en esas coordenadas
spm<-sp

for (t in 1:time) {
  image(t(sp[25:1,]), col=c('white','black'),breaks=c(0, 0.5, 1))
  # para que sea intuitivo se rota la matriz en el espacio, decimos colores, 0 blanco, 1 negro
  grid(25, 25, lwd = 0.5, col='grey', lty=1)
  # gradilla
  
  print(sum(sp))
  readline(prompt='Press [enter] to continue')
  # es como hacer un video sin hacerlo, te pide confirmacion
  
  # queremos calcular el estado al que va a cambiar
  # itera el primero en eje x, segundo en eje y
  # nos mira x 1, y del 1 al 25 y así
  for (x in 1:25) {
    for (y in 1:25){
      
      sp[x,y]<-0+(spm[x,y]==0)
      # en spm tenemos la matriz anterior
      # miramos si el estado anterior es 0
      # entonces sería true
      # entonces sería 1
      # si en el anterior teníamos 0, ahora es 1
      # si en el anterior teníamos 1, ahora es 0
      # parpadea, sería nuestro reloj
      
      xup=x+1
      xdw=x-1
      yup=y+1
      ydw=y-1
      # indica las coordenadas de los vecinos
      
      if (x==1) {xdw=x}
      if (x==25) {xup=x}
      if (y==1) {ydw=y}
      if (y==25) {yup=y}
      # para no dar coordenadas fuera de la matriz
      
      nei<-median(c(spm[xdw,y],spm[xup,y],spm[x,yup],spm[x,ydw],spm[xdw,ydw],spm[xup,yup],spm[xdw,yup],spm[xup,ydw]))
      # median toma el valor mediano, toma la mayoría, cuando la mayoría son 0 tenemos 0, cuando la mayoría son 1, tenemos 1
      
      if (sp[x,y]==1 & runif(1)>th & nei==1) {
        # primero vemos que si es 1 lo que tenemos en la casilla
        # da un numero aleatorio del 0 al 1
        # th dice lo influenciable que es la luciernaga
        # si mis vecinos van a flashear vamos a ver si eres influenciable
        # y si te toca un flash te vamos a influenciar
        # y te vamos a influenciar
        # si te toca ser 1, los vecinos son 1, y eres influenciable
        # pues vas a ser 0
        
        sp[x,y]<-0
      }
    }
  }
  spm<-sp
}

# numero inicial de subgrupos
# con pocos, se acaban extinguiendo
# con muchos, se forman clusters

