DIR = 'C:/Users/cseidel/Desktop/SUMMER_DATA/AIRS_DATA';
a = dir('C:/Users/cseidel/Desktop/SUMMER_DATA/AIRS_DATA/ENSO_COMP');

i = 3;

varnames=["CloudTopTemp_TqJ_A", "CloudTopTemp_TqJ_D", "CloudTopPres_TqJ_A", "CloudTopPres_TqJ_D"];
difftitles = ["Cloud Top Temperature (Ascending) ", "Cloud Top Temperature (Descending) ", "Cloud Top Pressure (Ascending) ", "Cloud Top Pressure (Descending) "];

ENSO = [0.311 0.828333333 0.447666667 0.181333333 0.050666667 0.141666667 -0.977 -0.115666667 0.381333333 -1.362333333 -0.526333333 -0.101666667 0.027666667 1.003333333]

for k = 1:14
    afn=[DIR,a(i).name];
    fnum=i;
    fn1 = a(i).name;
    fn = char(fn1);
    fileinfo = hdfinfo(fn);
    
    for l=1:length(varnames)
        CTP_A = hdfread(fn, char(varnames(l)));
        CTP_A(CTP_A < -999) = NaN;

        clat = hdfread(fn, 'Latitude');
        clon = hdfread(fn, 'Longitude');

         for j = 1:2
            afn2 = [DIR,a(i + j).name];
            fn2 = a(i + j).name;
            fnn = char(fn2);
            CTP2 = hdfread(fnn, char(varnames(l)));
            CTP2(CTP2< -999) = NaN;
            CTP_A = CTP_A + CTP2;
        end
        i = i + 3;

        CTP_A = CTP_A/3;


        CTP_A_3D(:, :, k) = CTP_A;
        
        for ir = 1:180
            for ic = 1:360
                CTP_A_Sq = squeeze(CTP_A_3D(ir, ic, :));
                CTP_A_Sq(CTP_A_Sq==-9999) = NaN;
                ind = 1:length(CTP_A_Sq);
                x = ~isnan(CTP_A_Sq);
                CTP_A_2 = polyfit(ENSO(x), CTP_A_Sq(x)', 1);
                CTP_A_Final(ir, ic) = CTP_A_2(1)/10;
            end
        end

        load coast;
        figure();
        colormap(jet)
        pcolor(clon, clat, CTP_A_Final); shading flat
        hold on; plot(long, lat, 'k');
        caxis([-1, 1]); colorbar
        title(strcat(char(difftitles(l)), 'Correlation Over Time'));
        xlabel('Longitude');
        ylabel('Latitude');
        hold on;
    end
end  