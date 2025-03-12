// Seed: 1306908811
module module_0 (
    input wire id_0,
    input tri1 id_1,
    output tri1 id_2,
    output tri id_3,
    input tri0 id_4,
    input wor id_5,
    output tri id_6,
    input tri id_7,
    output wor id_8,
    input wor id_9,
    input supply0 id_10
    , id_14,
    input wand id_11,
    input wor id_12
    , id_15
);
endmodule
module module_1 (
    input tri id_0,
    input supply0 id_1,
    input wor id_2,
    input uwire id_3,
    input wor id_4,
    input tri id_5,
    output uwire id_6,
    inout wand id_7
    , id_17,
    input supply0 id_8,
    input supply0 id_9,
    input supply1 id_10,
    input supply0 id_11,
    input tri0 id_12,
    input tri id_13,
    output supply0 id_14,
    output logic id_15
);
  module_0 modCall_1 (
      id_0,
      id_11,
      id_6,
      id_7,
      id_1,
      id_5,
      id_6,
      id_12,
      id_6,
      id_7,
      id_9,
      id_9,
      id_10
  );
  assign modCall_1.id_1 = 0;
  assign id_7 = id_2#(
      .id_8(1),
      .id_1(-1'b0),
      .id_0(1)
  );
  always @(posedge id_8) id_15 = id_4 + -1;
  wire id_18;
endmodule
