// Seed: 1470779101
module module_0 (
    input wor id_0,
    output tri0 id_1,
    input tri1 id_2,
    output supply1 id_3
    , id_9,
    input wire id_4,
    output wand id_5
    , id_10,
    input tri id_6,
    input supply1 id_7
);
  wire [-1 : -1  -  -1] id_11;
  wire id_12;
  logic id_13;
  ;
  id_14 :
  assert property (@(posedge id_11) id_10)
  else $signed(66);
  ;
  assign module_1.id_2 = 0;
  wire id_15;
  assign id_3 = id_10[1];
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    output supply0 id_2,
    output wand id_3,
    input wor id_4,
    output supply0 id_5,
    output wand id_6,
    input uwire id_7,
    input tri1 id_8,
    input wire id_9,
    input tri0 id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_10,
      id_3,
      id_8,
      id_5,
      id_1,
      id_5,
      id_4,
      id_7
  );
endmodule
