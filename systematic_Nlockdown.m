%function [lockedG, l_down] = syst_lockdown(p, G, n)
%NETWORK_LOCKDOWN Summary of this function goes here
%   Detailed explanation goes here

n = 100;
G = social_network(n, 10, 2, 20);
p = 0.3;
ids = 1:n;

subG = zeros(n, n);
l_down = zeros(1, n);

[degrees, node] = max(degree(graph(G)));
nodes = node; 

pd = makedist("Poisson", 2.2);
t = truncate(pd, 1, inf);



while sum(l_down) <= floor(p*n)
    if ~isempty(nodes)
        rand_id = randsample(length(nodes),1);
        node = nodes(rand_id);
        contacts_not_ldown = ids(G(node,:) & (l_down==0)); %!!! want G(node,:)==1 and l_down==0
        l_down(node) = 1;

        x = random(t,1)-1;
        num = length(contacts_not_ldown);

        if num >= x
            num = x;
        end
        
        l_contacts = zeros(num,1);

        for i = 1:num
            rand_id = randsample(length(contacts_not_ldown),1);
            l_contact = contacts_not_ldown(rand_id);
            l_contacts(i) = l_contact;
            subG(l_contact,node) = 1;
            subG(node, l_contact) = 1;
            l_down(l_contact) = 1;
            contacts_not_ldown = contacts_not_ldown(contacts_not_ldown~=l_contact);
            nodes = nodes(nodes~=l_contact);
        end
        
        fprintf('node:%d\n', node);
        fprintf('num:%d\n', num);
        for i = 1:(length(l_contacts))
            fprintf('contact%d: %d\n',i,l_contacts(i));
        end


        for i = 1:length(l_contacts)
            for j = 1:length(l_contacts)
                if l_contacts(i) ~= l_contacts(j)
                    subG(l_contacts(i), l_contacts(j)) = 1;
                    subG(l_contacts(j), l_contacts(i)) = 1;
                end
            end
        end

        nodes = nodes(nodes~=node);
    else
        nodes = ids(G(node,:) & l_down==0);
    end

end

L = l_down | transpose(l_down);

lockedG = (G & subG & L) | (G & ~subG & ~L) | (~G & subG & L);

plot(graph(subG));
figure;
plot(graph(G));
figure;
plot(graph(lockedG));

%end

