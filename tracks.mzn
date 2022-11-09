enum Type = {A, B, C, D};
array[Type,Type] of var 0..1: allows = [|
% A, B, C, D
  0, 1, 0, 0 | % A
  1, 0, 1, 0 | % B
  0, 1, 0, 1 | % C
  0, 0, 1, 0   % D
|];

int: NrSections;

set of int: Sections = 1..NrSections;

array[Sections,Sections] of var 0..1: neighborship;

array[Sections] of var Type: indicators;

constraint forall (i,j in Sections where i<j) 
  (neighborship[i, j]==1 -> allows[indicators[i],indicators[j]] == 1);

solve satisfy;