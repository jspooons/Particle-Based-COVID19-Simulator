function [lockedG, l_down] = random_Nlockdown(p, G, n, flags)
%RANDOM_NLOCKDOWN Summary of this function goes here
%   Detailed explanation goes here

%n = 1000;
%G = social_network(n, 50, 2, 50);
%p = 0.3;
%flags = zeros(1, n);

ids = 1:n;
subG = zeros(n, n);
l_down = flags;

pd = makedist("Poisson", 2.2);
t = truncate(pd, 1, inf);

while sum(l_down) < floor(p*n)
    unlocked_ids = ids(l_down==0);

    rand_id = randsample(length(unlocked_ids),1);
    node = unlocked_ids(rand_id);
    l_down(node) = 1;
    contacts_not_ldown = ids(G(node,:) & (l_down==0));

    x = random(t,1)-1;
    num = length(contacts_not_ldown);

    if num >= x
        num = x;
    end

    l_contacts = zeros(num,1);

    for i = 1:num
        rand_id = randsample(length(contacts_not_ldown), 1);
        l_contact = contacts_not_ldown(rand_id);
        l_contacts(i) = l_contact;
        contacts_not_ldown = contacts_not_ldown(contacts_not_ldown~=l_contact);
        subG(l_contact, node) = 1;
        subG(node, l_contact) = 1;
        l_down(l_contact) = 1;
    end

    for i = 1:length(l_contacts)
        for j = 1:length(l_contacts)
            if l_contacts(i) ~= l_contacts(j)
                subG(l_contacts(i), l_contacts(j)) = 1;
                subG(l_contacts(j), l_contacts(i)) = 1;
            end
        end
    end
end

L = l_down | transpose(l_down);

lockedG = (G & subG & L) | (G & ~subG & ~L) | (~G & subG & L);

%plot(graph(subG));
%figure;
%plot(graph(G));
%figure;
%plot(graph(lockedG));

end

