x = 1:5;
y = 1:5;
[X,Y] = meshgrid(x,y);
points = [X(:), Y(:)];
n = size(points,1);
qIdx = logical(randsample(n,3));
Z = points(qIdx,:);

r = 1.0;

Mdl = ExhaustiveSearcher(points);
Idx = rangesearch(Mdl,Z,r,'Distance','cityblock');

ns = createns(points, 'nsmethod', 'kdtree', 'distance', 'cityblock');
[ind_contacts, dst] = rangesearch(ns,Z,r);

close all
figure;
plot(points(:,1), points(:,2), '.k')
hold on;
plot(Z(:,1),Z(:,2),'*r');

for j = 1:numel(qIdx)
    c = Z(j,:);
    circleFun = @(x1,x2)r^2 - (x1 - c(1)).^2 - (x2 - c(2)).^2;
    fimplicit(circleFun, [c(1) + [-1 1]*r, c(2) + [-1 1]*r],'b-')
end

legend('Observations','Query Data','Search Radius');

axis([0 6 0 6])
hold off

