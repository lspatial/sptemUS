

conOptNo2=function(no2x_season_trends,asite_dt,predId="preno2"){
  ## no2x_season_trends=tsereris;asite_dt= dtasite; predId="mean"
  asite_dt1=asite_dt
  basis_tindex=match(asite_dt1$biweekid,no2x_season_trends$biweekid)
  lmdset=data.frame(biweekid=asite_dt1$biweekid,b0=rep(1,nrow(asite_dt1)),
                    b1=no2x_season_trends[basis_tindex,"no2V1"],
                    b2=no2x_season_trends[basis_tindex,"no2V2"],
                    no2_m=log(asite_dt1[,predId]))
  lmdset=lmdset[which(!is.na(lmdset[,"no2_m"])),]
  lc_A=as.matrix(lmdset[,c("b0","b1","b2")])
  lc_B=as.vector(lmdset$no2_m)
  lc_G=matrix(nrow=6,ncol=3,byrow=TRUE,data=c(1,0,0,  0,-1,0,  -1,0,0,  0,1,0,  0,0,1,  0,0,-1))
  lc_H=c(-0.5,0.2,-5,-0.8,-0.4,-0.5) #max and min of intercept, temporal basis1 and temporal basis2 this is based on AQS station data
  for(j in c(1:nrow(no2x_season_trends))){
    arow=c(-1,-no2x_season_trends[j,"no2V1"],-no2x_season_trends[j,"no2V2"])
    lc_G=rbind(lc_G,arow)
    lc_H=c(lc_H,-log(350))
    #setting the max value of output prediction to 350 (this is based on the data)
  }
  # setting declining trend in air pollution over time period
  years=as.numeric(format(no2x_season_trends$s_date,'%Y'))
  start_year=min(years)
  end_year=max(years)
  fromDt=as.Date("1992-01-01")
  start_date=as.Date(paste(start_year,"-01-01",sep=""))
  end_date=as.Date(paste(end_year,"-01-01",sep=""))
  bkId1=as.numeric(floor((start_date-fromDt)/14)+1)
  bkId2=as.numeric(floor((end_date-fromDt)/14)+1)
  arow=c(0,no2x_season_trends[bkId1,"no2V1"]-no2x_season_trends[bkId2,"no2V1"],
         no2x_season_trends[bkId1,"no2V2"]-no2x_season_trends[bkId2,"no2V2"])
  if(!is.na(arow[2]) && !is.na(arow[3])){
    lc_G=rbind(lc_G,arow)
    lc_H=c(lc_H,0) #non-negative predictions
  }
  try_res=try((lm_cons=limSolve::lsei(A =lc_A, B =lc_B, G =lc_G, H=lc_H,type=2)),silent=T)
  if(class(try_res)=="try-error"){
    return
  }
  beta_para=data.frame(b0=lm_cons$X["b0"],b1=lm_cons$X["b1"],  b2=lm_cons$X["b2"])
  series=exp(beta_para[1,"b0"]+beta_para[1,"b1"]*no2x_season_trends$no2V1
             +beta_para[1,"b2"]*no2x_season_trends$no2V2)
  # plot(no2x_season_trends$s_date,series,type="l")
  # points(as.Date(asite_dt$s_date),asite_dt$preno2M)
  # range(series); range(asite_dt$no2)
  return(list(bpara=beta_para,series=data.frame(start_date=no2x_season_trends$s_date,sim=series)))

}
