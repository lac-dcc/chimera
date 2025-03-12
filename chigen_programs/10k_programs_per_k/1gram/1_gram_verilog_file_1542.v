// Seed: 1863673848
module module_0 (
    input tri id_0
    , id_17,
    output uwire id_1,
    input wor id_2,
    input tri id_3,
    input wand id_4,
    input uwire id_5,
    input supply1 id_6,
    output wand id_7,
    input supply1 id_8,
    output supply1 id_9,
    input supply0 id_10,
    input supply0 id_11,
    input tri id_12,
    output tri id_13,
    output wand id_14,
    input tri1 id_15
);
  localparam id_18 = 1;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    inout supply1 id_0,
    output wand id_1,
    output supply0 id_2
);
  struct packed {logic id_4;} [-1 : 1] id_5;
  logic id_6 = id_5.id_4, id_7;
  id_8 :
  assert property (@(1 or id_6) id_0) if (1) id_6 = -1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_5,
      id_0,
      id_4,
      id_5,
      id_0,
      id_2,
      id_4,
      id_4,
      id_0,
      id_0,
      id_4,
      id_4,
      id_2,
      id_5
  );
endmodule
