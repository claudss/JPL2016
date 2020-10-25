% put subfolder [with HDF5 file/s + .m file] in a parent
% folder; DIR is the path of the parent folder
DIR = '/home/research3/data';

% this will be the path of the DPR folder
a = dir('/home/research3/data/airsx3');

currFolder = pwd;
varnames=["CloudTopTemp_TqJ_A", "CloudTopTemp_TqJ_D", "CloudTopPres_TqJ_A", "CloudTopPres_TqJ_D"];
difftitles = ["Average Cloud Top Temperature (Ascending) - Winter", "Average Cloud Top Temperature (Descending) - Winter", "Average Cloud Top Pressure (Ascending) - Winter", "Average Cloud Top Pressure (Descending) - Winter"];

%load coast;
i = 3;

for k = 1:14
    year = char(" " + num2str(2001 + k))
    afn=[DIR,a(i).name];
    fnum=i;
    fn1 = a(i).name;
    fn = char(fn1);
    fileinfo = hdfinfo(fn);
    for l = 1:length(varnames)
        testvar = hdfread(fn, varnames(l));
        clat = hdfread(fn, 'Latitude');
        clon = hdfread(fn, 'Longitude');
        for j = 1:2
            afn2 = [DIR,a(i + j).name];
            fn2 = a(i + j).name;
            fnn = char(fn2);
            testvar = testvar + hdfread(fnn, varnames(l));
        end
        i = i + 3;
        testvar = testvar/3;
        figure; pcolor(clon, clat, testvar); shading interp
        caxis([200, 300]);colorbar
        colormap jet
        hold on;
        title(strcat(difftitles(l), year))
        plot(long, lat, 'k');
        xlim ([-128 85])
        ylim ([-45 45])
        xlabel('Longitude', 'FontSize', 14)
        ylabel('Latitude', 'FontSize', 14)
        hold on;
        testvar = [];
    end 

end