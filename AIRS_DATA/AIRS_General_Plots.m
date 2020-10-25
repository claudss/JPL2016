load coast;
filenames = ["AIRS.2010.12.01.L3.RetStd031.v6.0.9.0.G13090075416.hdf", "AIRS.2011.01.01.L3.RetStd031.v6.0.9.0.G13067125937.hdf", "AIRS.2011.02.01.L3.RetStd028.v6.0.9.0.G13067163936.hdf"];
filenames2 = ["AIRS.2015.12.01.L3.RetStd031.v6.0.31.0.G16005163635.hdf", "AIRS.2016.01.01.L3.RetStd031.v6.0.31.0.G16034171018.hdf", "AIRS.2016.02.01.L3.RetStd029.v6.0.31.0.G16063171358.hdf"];
%filename = thisfile;
% AIRS.2011.01.01.L3.RetStd031.v6.0.9.0.G13067125937.hdf
for i=1:length(filenames)
    thisfile = char(filenames(i))
    thisfile2 = char(filenames2(i))
    hinfo = hdfinfo(thisfile);
    month = '';
    month2 = '';
    
    switch thisfile
        case 'AIRS.2010.12.01.L3.RetStd031.v6.0.9.0.G13090075416.hdf'
            month = ' December 2010';
        case 'AIRS.2011.01.01.L3.RetStd031.v6.0.9.0.G13067125937.hdf'
            month = ' January 2011';
        case 'AIRS.2011.02.01.L3.RetStd028.v6.0.9.0.G13067163936.hdf'
            month = ' February 2011';
    end
    
    
    switch thisfile2
        case 'AIRS.2015.12.01.L3.RetStd031.v6.0.31.0.G16005163635.hdf'
            month2 = ' December 2015';
        case 'AIRS.2016.01.01.L3.RetStd031.v6.0.31.0.G16034171018.hdf'
            month2 = ' January 2016';
        case 'AIRS.2016.02.01.L3.RetStd029.v6.0.31.0.G16063171358.hdf'
            month2 = ' February 2011';
    end
    
    %%
    % get all variables
    %hinfo = hdfinfo(thisfile);

    clat = hdfread(thisfile, 'Latitude');
    clon = hdfread(thisfile, 'Longitude');

    CloudTopTemp_TqJ_A = hdfread(thisfile, 'CloudTopTemp_TqJ_A');
    CloudTopTemp_TqJ_A_ct = hdfread(thisfile, 'CloudTopTemp_TqJ_A_ct');

    CloudTopTemp_TqJ_D = hdfread(thisfile, 'CloudTopTemp_TqJ_D');
    CloudTopTemp_TqJ_D_ct = hdfread(thisfile, 'CloudTopTemp_TqJ_D_ct');

    CloudTopPres_TqJ_A = hdfread(thisfile, 'CloudTopPres_TqJ_A');
    CloudTopPres_TqJ_A_ct = hdfread(thisfile, 'CloudTopPres_TqJ_A_ct');

    CloudTopPres_TqJ_D = hdfread(thisfile, 'CloudTopPres_TqJ_D');
    CloudTopPres_TqJ_D_ct = hdfread(thisfile, 'CloudTopPres_TqJ_D_ct');

    %% CLEAR -9999

    CloudTopTemp_TqJ_A(CloudTopTemp_TqJ_A<-998)=NaN;
    CloudTopTemp_TqJ_A_ct(CloudTopTemp_TqJ_A_ct<-998)=NaN;
    CloudTopTemp_TqJ_D(CloudTopTemp_TqJ_D<-998)=NaN;
    CloudTopTemp_TqJ_D_ct(CloudTopTemp_TqJ_D_ct<-998)=NaN;

    CloudTopPres_TqJ_A(CloudTopPres_TqJ_A<-998)=NaN;
    CloudTopPres_TqJ_A_ct(CloudTopPres_TqJ_A_ct<-998)=NaN;
    CloudTopPres_TqJ_D(CloudTopPres_TqJ_D<-998)=NaN;
    CloudTopTemp_Pres_D_ct(CloudTopPres_TqJ_D_ct<-998)=NaN;


    %% CALCULATIONS

    CloudTopTemp_TqJ_Av = (CloudTopTemp_TqJ_A + CloudTopTemp_TqJ_D)/2;
    CloudTopTemp_TqJ_Av_ct = (CloudTopTemp_TqJ_A_ct + CloudTopTemp_TqJ_D_ct)/2;

    CloudTopPres_TqJ_Av = (CloudTopPres_TqJ_A + CloudTopPres_TqJ_D)/2;
    CloudTopPres_TqJ_Av_ct = (CloudTopPres_TqJ_A_ct + CloudTopPres_TqJ_D_ct)/2;

    %% get partner data
    CTT_A = hdfread(thisfile2, 'CloudTopTemp_TqJ_A');
    CTT_A_ct = hdfread(thisfile2, 'CloudTopTemp_TqJ_A_ct');
    CTT_A(CTT_A<-998)=NaN;
    CTT_A_ct(CTT_A_ct<-998)=NaN;


    CTT_D = hdfread(thisfile2, 'CloudTopTemp_TqJ_D');
    CTT_D_ct = hdfread(thisfile2, 'CloudTopTemp_TqJ_D_ct');
    CTT_D(CTT_D<-998)=NaN;
    CTT_D_ct(CTT_A_ct<-998)=NaN;

    CTP_A = hdfread(thisfile2, 'CloudTopPres_TqJ_A');
    CTP_A_ct = hdfread(thisfile2, 'CloudTopPres_TqJ_A_ct');
    CTP_A(CTP_A<-998)=NaN;
    CTP_A_ct(CTP_A_ct<-998)=NaN;

    CTP_D= hdfread(thisfile2, 'CloudTopPres_TqJ_D');
    CTP_D_ct = hdfread(thisfile2, 'CloudTopPres_TqJ_D_ct');
    CTP_D(CTP_D<-998)=NaN;
    CTP_D_ct(CTP_D_ct<-998)=NaN;

    Diff_TA = CTT_A - CloudTopTemp_TqJ_A;
    Diff_TD = CTT_D - CloudTopTemp_TqJ_D;
    Diff_TAct = CTT_A_ct - CloudTopTemp_TqJ_A_ct;
    Diff_TDct = CTT_D_ct - CloudTopTemp_TqJ_D_ct;

    Diff_PA = CTP_A - CloudTopPres_TqJ_A;
    Diff_PD = CTP_D - CloudTopPres_TqJ_D;
    Diff_PAct = CTP_A_ct - CloudTopPres_TqJ_A_ct;
    Diff_PDct = CTP_D_ct - CloudTopPres_TqJ_D_ct;

    avgs = [CloudTopTemp_TqJ_Av, CloudTopTemp_TqJ_Av_ct, CloudTopPres_TqJ_Av, CloudTopPres_TqJ_Av_ct];
    diffs = [Diff_TA, Diff_TD, Diff_TAct, Diff_TDct, Diff_PA, Diff_PD, Diff_PAct, Diff_PDct];
    vars1  = [CloudTopTemp_TqJ_A,  CloudTopTemp_TqJ_A_ct, CloudTopTemp_TqJ_D, CloudTopTemp_TqJ_D_ct, CloudTopPres_TqJ_A, CloudTopPres_TqJ_A_ct, CloudTopPres_TqJ_D, CloudTopPres_TqJ_D_ct];
    vars2 = [CTT_A, CTT_A_ct, CTT_D, CTT_D_ct, CTP_A, CTP_A_ct, CTP_D, CTP_D_ct];
    avgtitles = ["Average Cloud Top Temperature", "Average Cloud Top Temperature Count", "Average Cloud Top Pressure", "Average Cloud Top Pressure Count"];
    maintitles = ["Cloud Top Temperature in Degrees Kelvin (Ascending)", "Cloud Top Temperature Count (Ascending)", "Cloud Top Temperature in Degrees Kelvin (Descending)", "Cloud Top Temperature Count (Descending)", "Cloud Top Pressure in hPa (Ascending)", "Cloud Top Pressure Count (Ascending)", "Cloud Top Pressure in hPa (Descending)", "Cloud Top Pressure Count (Descending)"];
    difftitles = [" Cloud Top Temperature (Ascending)", " Cloud Top Temperature Count (Ascending)", " Cloud Top Temperature (Descending)", " Cloud Top Temperature Count (Descending)", " Cloud Top Pressure in hPa (Ascending)", " Cloud Top Pressure Count (Ascending)", " Cloud Top Pressure in hPa (Descending)", " Cloud Top Pressure Count (Descending)"];
    

    % get averages
    for j=1:length(vars1)
        av1 = figure(1);
        title(strcat(char(maintitles(j)), ' - ', month));
        pcolor(clon, clat, avgs(j)); shading interp
        caxis([-450, 450]);colorbar
        colormap jet
        hold on;
        plot(long, lat, 'k');
        xlim ([-128 85])
        ylim ([-45 45])
        xlabel('Longitude', 'FontSize', 14)
        ylabel('Latitude', 'FontSize', 14)
        hold on;
        
        av2 = figure(2);
        title(strcat(char(avgtitles(j)), ' - ', month2));
        pcolor(clon, clat, avgs(j)); shading interp
        caxis([-450, 450]);colorbar
        colormap jet
        hold on;
        plot(long, lat, 'k');
        xlim ([-128 85])
        ylim ([-45 45])
        xlabel('Longitude', 'FontSize', 14)
        ylabel('Latitude', 'FontSize', 14)
        hold on;
    end
    
    % get standard values
    for j=1:length(vars1)
        st1 = figure(1);
        title(strcat(char(maintitles(j)), ' - ', month));
        pcolor(clon, clat, vars1(j)); shading interp
        caxis([-450, 450]);colorbar
        colormap jet
        hold on;
        plot(long, lat, 'k');
        xlim ([-128 85])
        ylim ([-45 45])
        xlabel('Longitude', 'FontSize', 14)
        ylabel('Latitude', 'FontSize', 14)
        hold on;
        
        st2 = figure(2);
        title(strcat(char(maintitles(j)), ' - ', month2));
        pcolor(clon, clat, vars2(j)); shading interp
        caxis([-450, 450]);colorbar
        colormap jet
        hold on;
        plot(long, lat, 'k');
        xlim ([-128 85])
        ylim ([-45 45])
        xlabel('Longitude', 'FontSize', 14)
        ylabel('Latitude', 'FontSize', 14)
        hold on;
    end
    
    % get differences
    for j=1:length(diffs)
        d1 = figure(1);
        title(strcat('Difference in ', char(difftitles(j)), ' between ', month, ' and ', month2));
        pcolor(clon, clat, diffs(j)); shading interp
        caxis([-450, 450]);colorbar
        colormap jet
        hold on;
        plot(long, lat, 'k');
        xlim ([-128 85])
        ylim ([-45 45])
        xlabel('Longitude', 'FontSize', 14)
        ylabel('Latitude', 'FontSize', 14)
        hold on;
    end
end





