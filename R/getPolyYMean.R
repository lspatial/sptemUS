#
#
#
#
getPolyYMean=function(polys,samp,tse,idF="siteid",ridF="rid",obsF="obs",dateF="date"){

  # polys=res$polys;samp=samp; idF="siteid"; tse=filled_series;ridF="rid";obsF="obs";dateF="date"
  samp@data[,ridF]=getRidbytpoly(polys,samp)
  index=match(tse[,idF],samp@data[,idF])
  tse[,ridF]=samp@data[index,ridF]
  tse$month=as.integer(format(tse$date,"%m"))
  tse$year=as.integer(format(tse$date,"%Y"))
  strCmd=paste('plyr::ddply(tse,c("',ridF,'","year"),plyr::summarise,avg=mean(obs,na.rm=TRUE))',sep='')
  result=eval(parse(text=strCmd))
  return(result)
}
