// Seed: 2313568863
module module_0 (
    output tri0 id_0,
    output tri1 id_1,
    input wor id_2,
    input wand id_3,
    input tri1 id_4,
    input tri id_5
    , id_18,
    input uwire id_6,
    input supply1 id_7,
    input wor id_8,
    input wire id_9,
    output tri0 id_10,
    input tri id_11,
    output wand id_12,
    output wand id_13,
    input uwire id_14,
    input tri0 id_15,
    input supply1 id_16
);
  generate
    always @(negedge 1);
  endgenerate
  wire id_19;
endmodule
module module_1 (
    output tri1 id_0,
    input supply0 id_1,
    output tri1 id_2,
    input wire id_3,
    input wand id_4,
    output wire id_5,
    input tri1 id_6,
    output tri0 id_7,
    input supply0 id_8
);
  wire id_10;
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_8,
      id_6,
      id_1,
      id_3,
      id_8,
      id_8,
      id_4,
      id_2,
      id_8,
      id_5,
      id_2,
      id_3,
      id_8,
      id_6
  );
  assign modCall_1.type_8 = 0;
  always @(negedge id_1 & id_8 or posedge !1) assert (id_1);
  wire id_12;
  wire id_13;
  assign id_0 = 1 & 1'b0;
  wire id_14;
endmodule
