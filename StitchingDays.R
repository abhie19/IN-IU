day1 = read.csv("/Users/Abhishek/Downloads/01.csv", header = FALSE, stringsAsFactors=FALSE)
colnames(day1) <- c("start_time", "end_time" ,"some1", "s_ip", "d_ip", "s_port", "d_port", "protocol", "flag", "some2", "some3", "flows", "size", "some4", "some5", "some6", "some7", "some8", "some9")
sapply(day1,class)

day2 = read.csv("/Users/Abhishek/Downloads/02.csv", header = FALSE, stringsAsFactors=FALSE)
colnames(day2) <- c("start_time", "end_time" ,"some1", "s_ip", "d_ip", "s_port", "d_port", "protocol", "flag", "some2", "some3", "flows", "size", "some4", "some5", "some6", "some7", "some8", "some9")

# See data type
#sapply(day1,class)
# sapply(day2,class)

day1$start_time <- strptime(x = as.character( day1$start_time ), format = "%Y-%m-%d %H:%M:%S")
day1$end_time <- strptime(x = as.character( day1$end_time ), format = "%Y-%m-%d %H:%M:%S")

day2$start_time <- strptime(x = as.character( day2$start_time ), format = "%Y-%m-%d %H:%M:%S")
day2$end_time <- strptime(x = as.character( day2$end_time ), format = "%Y-%m-%d %H:%M:%S")

day1_filtered <- day1[day1$end_time>"2015-12-01 23:55:00 EST",]
day2_filtered <- day2[(day2$start_time>"2015-12-01 23:55:00 EST" & day2$start_time<"2015-12-01 23:59:59 EST") ,]

count = 0 
for(i in 1:nrow(day1_filtered)) {
  day1_s_ip <- day1_filtered[i,'s_ip']
  day1_d_ip <- day1_filtered[i,'d_ip']
  day1_s_port <- day1_filtered[i,'s_port']
  day1_d_port <- day1_filtered[i,'d_port']
  day1_protocol <- day1_filtered[i,'protocol']
  
    for(j in 1:nrow(day2_filtered)){
      day2_s_ip <- day2_filtered[j,'s_ip']
      day2_d_ip <- day2_filtered[j,'d_ip']
      day2_s_port <- day2_filtered[j,'s_port']
      day2_d_port <- day2_filtered[j,'d_port']
      day2_protocol <- day2_filtered[j,'protocol']
      
      if((day1_s_ip == day2_s_ip) & (day1_d_ip == day2_d_ip) & (day1_s_port == day2_s_port) & (day1_d_port==day2_d_port) & (day1_protocol==day2_protocol)){
        print(count)
        count=count+1
        print("stichable flow found")
        print(day1_filtered[i,])
        print(day2_filtered[j,])
        }
    }
}

