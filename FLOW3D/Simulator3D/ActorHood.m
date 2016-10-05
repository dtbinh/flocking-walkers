function hood=ActorHood(d,n)
% function hood=ActorHood(d,n)
%
% hood    neighborhood with radius d of ego-Actor n (OUTPUT)
% n       ego-Actor id (INPUT)

global N T t x y z p q r D v0 wpc

hood=find(D(n,:)<d);
hood=setdiff(hood,n);