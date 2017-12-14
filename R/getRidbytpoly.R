

getRidbytpoly=function(tpolys,pntlayer,isnearest=TRUE){
  # tpolys=res$tpolys ;pntlayer=samplepnt
  tarprj=sp::proj4string(tpolys)
  if(sp::proj4string(pntlayer)!=tarprj){
    pntlayer=sp::spTransform(pntlayer,tarprj)
  }
  idinpoly=sp::over(pntlayer,as(tpolys,"SpatialPolygons"))
  rids=tpolys@data[idinpoly,"ID"]
  index=which(is.na(rids))
  if(!isnearest || length(index)==0)
    return(rids)

  for(i in c(1:length(index))){ # i=1
    aindex=index[i]
    rids[aindex]=tpolys@data[which.min(rgeos::gDistance(pntlayer[aindex,], as(tpolys,"SpatialPolygons"), byid=TRUE)),"ID"]
  }
  return(rids)
}
