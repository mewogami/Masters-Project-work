%Extracting datapoints which does not have missing data for whole duration to reduce data
%dimension and work on data points which lie inside India .

  India_Coordinates=zeros(length(IMDRf_1901_2017),3);  
    
for   r=1:length(IMDRf_1901_2017)
    India_Coordinates(r,1)=IMDRf_1901_2017{r,1}(1,1);
    India_Coordinates(r,2)=IMDRf_1901_2017{r,1}(1,2);
    India_Coordinates(r,3)=max(IMDRf_1901_2017{r,2});
end

count=1;
for r=1:length(IMDRf_1901_2017)
    if India_Coordinates(r,3)~=-999
    IMD_IndCord(count,:)=India_Coordinates(r,:);
    count=count+1;
    end
end

csvwrite('IMD_IndCord.csv',IMD_IndCord);

%Using India boundary shapefile and taking a buffer of 0.25deg, using this
%shapefile to clip data lying inside india boundary

%Uploading the extracted data for lat_long

Ind_Coord=shaperead('E:\01_PhD\04_Research_Work\04_Shapefiles\03_IMD_Grid_IndBound_Buffer.shp');
COORDINATES=zeros(length(Ind_Coord),2);
for r=1:length(Ind_Coord)
    COORDINATES(r,1)=Ind_Coord(r,1).Y;
    COORDINATES(r,2)=Ind_Coord(r,1).X;
end


csvwrite('COORDINATES.csv',COORDINATES);