enum Type = {A, B, C, D};
array[Type,Type] of 0..1: allows = [|
% A, B, C, D
  0, 1, 0, 0 | % A
  1, 0, 1, 0 | % B
  0, 1, 0, 1 | % C
  0, 0, 1, 0   % D
|];

array[Type] of int: costs = [1, 2, 3, 4];
%var int: totalCosts;

int: NrSections;

set of int: Sections = 1..NrSections;

array[Sections,Sections] of 0..1: neighborship;

array[Sections] of var Type: indicators;

constraint forall (i,j in Sections where i<j) 
  (neighborship[i, j]==1 -> allows[indicators[i],indicators[j]] == 1);

%constraint totalCosts = sum(i in Sections)(d[i,j]);
var int: c = sum(i in Sections)(costs[indicators[i]]);
var int: d = max(i in Type)(count(indicators, i)) - min(i in Type)(count(indicators, i));

%solve minimize c;
%solve minimize d;

solve satisfy;
output ["c=\(c) d=\(d)\n"];