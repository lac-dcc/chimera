// Seed: 2616950841
module module_0 (
    output supply0 id_0,
    input wor id_1,
    input wire id_2,
    output supply0 id_3,
    input supply0 id_4,
    input wor id_5,
    output tri1 id_6,
    output tri1 id_7,
    output tri1 id_8,
    input tri id_9,
    input supply1 id_10,
    output wire id_11,
    output uwire id_12,
    input wire id_13,
    input tri0 id_14,
    input tri0 id_15,
    input supply1 id_16,
    input wand id_17,
    input wand id_18,
    input tri0 id_19,
    input wand id_20
);
  assign id_11 = -1;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input tri0 id_1,
    output wire void id_2,
    input logic id_3,
    input tri0 id_4
);
  reg id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_4,
      id_2,
      id_2,
      id_1,
      id_4,
      id_4,
      id_0,
      id_4,
      id_1,
      id_0,
      id_4
  );
  id_7 :
  assert property (@(id_4) id_7) id_6 <= id_3;
endmodule
