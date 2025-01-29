// Seed: 707385163
module module_0 (
    input tri0 id_0,
    input wand id_1,
    output tri0 id_2,
    input wor id_3,
    input wire id_4,
    input wand id_5,
    output supply0 id_6,
    input supply0 id_7,
    input supply0 id_8
);
  assign id_2 = id_8;
  supply1 id_10;
  logic [7:0] id_11;
  tri1 id_12, id_13;
  id_14(
      1
  );
  for (id_15 = -1'b0; 1; id_10 = id_3) assign id_6 = id_11[1];
  assign module_1.id_11 = 0;
  assign id_13 = id_15;
  wire id_16, id_17;
  if (-1) parameter id_18 = -1;
  if (id_11) wire id_19;
  else wire id_20;
endmodule
module module_1 (
    output wand id_0,
    output tri0 id_1,
    output tri id_2,
    input uwire id_3,
    inout wand id_4,
    input supply0 id_5,
    input wire id_6,
    input tri1 id_7,
    input tri0 id_8,
    input wor void id_9
);
  uwire id_11, id_12;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_4,
      id_5,
      id_6,
      id_5,
      id_4,
      id_7,
      id_6
  );
  id_13 :
  assert property (@(1) id_12) #1 id_4 = id_3;
endmodule
