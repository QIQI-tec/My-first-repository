%% mean test
testing = dMLT_dX(:, :, 1);
% testing = nan(nlon, nlat);
% testing = mean(dMLT_dX, 3);
% for lat_id = 1 : nlat
%     ilat  = lat(lat_id);
%     iR    = R * cosd(ilat);
%     iDX   = 2 * pi * iR * (1/360 * resolution);
%     iMLTX = squeeze(MLT_MEAN(:, lat_id, time_id));
%     idMLT_dX = my_Finite_Difference(iMLTX, iDX, 1, "central", 2);
%     testing(:, lat_id) = idMLT_dX;
% end

title_text = 'dMLT-dX 1992.01';

figure
set(gcf,'position',[0 50 800 600]);
set(gcf,'color','w');

m_proj('miller','lon',[200,245],'lat',[10,25]);
m_contourf(lon, lat, testing', 20)
caxis([-4e-6 4e-6])
h1.LineStyle = 'none';
hold on
colormap( flip( othercolor('RdBu10' , 20 ) ) );
colorbar
set(gca, 'LineWidth', 1.2)
set(gca, 'FontSize' , 16)
m_coast( 'patch' , [ .82745 .82745 .82745 ]);
m_grid
title(title_text, ...
    'FontSize', 18, 'FontWeight', 'bold')

%% save
export_fig( gcf , '-png' , '-r300' , ['../figure/', title_text] );