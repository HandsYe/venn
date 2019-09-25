if (!require("venn")){
	install.packages("venn")
}
library(venn)
args<-commandArgs(T)

files<-args[1]  #输入的文件以逗号分隔
cl<-as.numeric(args[2])    #以哪一列来做venn
tit<-args[3] #有无title

#print(files)
#print(cl)
#print(tit)
if(length(args) != 3){
	print("something is wrong, please cheak!!!")
	print("USAGE:")
	print("Rscript venn.R files 1 F")
}else{
file<-unlist(strsplit(files,split = ","))
venn<-vector("list")
if(tit == "F"){
	for(i in 1:length(file)){
		a<-read.table(file[i], header = FALSE, sep = "\t")
		b<-a[,cl]
		#print(str(b))
		print(length(unique(b)))
		venn[[i]]<-b
	}
}else{
	for(i in file){
		a<-read.table(i, header = TRUE, sep = "\t")
		b<-a[,cl]
		print(length(unique(b)))
		venn[[i]]<-b
	}
}
#print(str(venn))
venn(venn, zcolor = "style", cexil = 1, cexsn = 0.8)
}
