hold on;
set(gca,'FontSize',18);

load fam_large;
ax=fam_large(:,2);
ex=fam_large(:,3);
six=fam_large(:,4);
plot(ax,ex,'k.')


load fam_ext;
aff=fam_ext(:,2);
eff=fam_ext(:,3);
siff=fam_ext(:,4);
scatter(aff,eff,36,'b')

plot(ax,ex,'k.')

xlabel('Proper semi-major axis [AU]','FontSize',18);
ylabel('Eccentricity','FontSize',18);

