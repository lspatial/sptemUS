

pyparpredict=function(dset,pol,flag='prefile',idF,nModel=6,ncore=6){
# dset=pre_dset_com1; flag='prenfile'; nModel=5; ncore=5
  tpath=paste(tempdir(),"/",flag,".rds",sep="")
  saveRDS(dset, file=tpath)
  url=paste("http://noxchs2.usc.edu:5023/pre",pol,sep="")
  res=RCurl::postForm(url, ncore=ncore,nModel=nModel,flag=flag,idF=idF,
           fileData = RCurl::fileUpload(tpath), .opts = list(verbose = TRUE))
  print(res[1])
}
