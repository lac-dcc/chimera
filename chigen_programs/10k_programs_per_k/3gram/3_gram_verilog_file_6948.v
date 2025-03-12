// Seed: 64717786
module module_0 (
    input tri1 id_0,
    output tri1 id_1,
    output tri id_2,
    output wire id_3,
    output wor id_4,
    input wor id_5,
    input supply0 id_6,
    output wand id_7,
    input tri0 id_8,
    output wor id_9,
    input tri id_10,
    output tri id_11,
    input uwire id_12,
    output tri1 id_13,
    input wor id_14,
    input tri id_15,
    output tri1 id_16
);
  logic id_18;
  ;
endmodule
module module_1 (
    input tri0 id_0,
    output tri0 id_1,
    output uwire id_2,
    output tri id_3,
    output wire id_4,
    output uwire id_5,
    input supply1 id_6,
    output logic id_7,
    output tri id_8,
    input tri0 id_9,
    input wor id_10,
    input wand id_11
);
  always_latch @(posedge -1'b0);
  assign id_5 = id_9;
  always_ff @(*) id_7 = 1'b0;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_5,
      id_1,
      id_11,
      id_11,
      id_3,
      id_11,
      id_8,
      id_0,
      id_1,
      id_11,
      id_3,
      id_10,
      id_0,
      id_5
  );
  assign modCall_1.id_6 = 0;
endmodule
