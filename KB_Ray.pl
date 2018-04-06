 
% Enter your KB below this line:

pick_restaurant(bawarchi) :-  memberOf(Cuisine , [seafood, hyderabadi]), cuisine(Cuisine), memberOf(Pay , [credit,cash]), payment(Pay), price(Price), smallerThan(800, Price). 

pick_restaurant(pista_house) :- memberOf(Cuisine , [indian, hyderabadi]), cuisine(Cuisine), memberOf(Pay , [credit,cash,paytm]), payment(Pay), price(Price), smallerThan(1200, Price). 

pick_restaurant(mainland_china) :- memberOf(Cuisine , [chinese, seafood]), cuisine(Cuisine), memberOf(Pay , [credit,cash,paytm]), payment(Pay), price(Price), smallerThan(1200, Price). 

memberOf(X, [Y|Ys]) :- X = Y ; memberOf(X, Ys). 
smallerThan(X,Y) :- X =< Y.
