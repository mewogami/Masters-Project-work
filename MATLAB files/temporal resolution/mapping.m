clear all

clc

% load the excel file
filename = 'coordinates.xlsx';
data = readtable(filename);

% create a map of unique latitude and longitude values
[unique_lat, ~, lat_idx] = unique(data.latitude);
[unique_lon, ~, lon_idx] = unique(data.longitude);
num_locations = length(unique_lat);

% create a new table with numerical values for latitude and longitude
new_data = table('Size', [length(data.latitude), 4], 'VariableTypes', {'double', 'double', 'double', 'double'}, 'VariableNames', {'lat', 'lon', 'lat_num', 'lon_num'});
for i = 1:length(data.latitude)
    lat = data.latitude(i);
    lon = data.longitude(i);
    lat_num = find(unique_lat == lat);
    lon_num = find(unique_lon == lon);
    new_data(i,:) = {lat, lon, lat_num, lon_num};
end

% display the new table
disp(new_data);
save ('new_data.mat')