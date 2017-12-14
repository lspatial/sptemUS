
getRidbytpolyFlag=function(tFlag,tpolyFl,pntlayer,isnearest=TRUE){
  # tpolys=res$tpolys ;pntlayer=samplepnt
  conn=RSclient::RS.connect(host="noxchs2.usc.edu",port =5501)
  RSclient::RS.assign(conn,"tFlag",tFlag)
  RSclient::RS.assign(conn,"tpolyFl",tpolyFl)
  RSclient::RS.assign(conn,"pntlayer",pntlayer)
  RSclient::RS.assign(conn,"isnearest",isnearest)
  rids=RSclient::RS.eval(conn,getRidbytpolyFlag(tFlag,tpolyFl,pntlayer,isnearest))
  RSclient::RS.close(conn)
  return(rids)
}
