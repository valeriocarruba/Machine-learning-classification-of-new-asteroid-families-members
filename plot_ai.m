hold on;
set(gca,'FontSize',18);

load fam_large;
ax=fam_large(:,2);
six=fam_large(:,4);
plot(ax,six,'k.')

load fam_ext;
aff=fam_ext(:,2);
siff=fam_ext(:,4);
scatter(aff,siff,36,'b')

plot(ax,six,'k.')

xlabel('Proper semi-major axis [AU]','FontSize',18);
ylabel('Sine of proper inclination','FontSize',18);
