// Seed: 2552889448
module module_0 (
    output uwire id_0,
    input wand id_1,
    input supply1 id_2,
    input tri1 id_3,
    output tri0 id_4,
    output supply1 id_5,
    input wor id_6,
    input tri id_7,
    output tri1 id_8,
    output wire id_9,
    output wand id_10,
    input tri0 id_11,
    input tri0 id_12,
    input tri id_13
);
  wire id_15, id_16, id_17, id_18, id_19, id_20;
endmodule
module module_1 (
    input supply0 id_0,
    output wire id_1,
    input supply0 id_2,
    input wire id_3,
    output logic id_4,
    output supply1 id_5
);
  id_7 :
  assert property (@(negedge 1) id_0) id_4 = id_0;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_0,
      id_2,
      id_5,
      id_1,
      id_0,
      id_0,
      id_5,
      id_5,
      id_1,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
