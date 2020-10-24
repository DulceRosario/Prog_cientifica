# plot.plt
set terminal x11 0
set title "Calculo de MFlops"
set nokey
set grid
set xrange [1:10000]
#set xtics ("20" 0, "100" 1, "1000" 2, "1100" 3, "1200" 4, "1300" 5 , "14x10^3" 6, "4x10^4" 7 ,"1x10^5" 8,"2x10^5" 9,"4x10^6" 10)
#set xtics ("10^1" 1, "10^2" 2,"10^3" 3,"10^4" 4,"10^5" 5,"10^6" 6,"10^7" 7)
set xlabel "N"
set ylabel "MFlops/sec"
m="data.txt"
plot m  with line