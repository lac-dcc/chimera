// Seed: 1133625692
module module_0 (
    input  tri0 id_0,
    input  wand id_1,
    output tri  id_2,
    output wand id_3,
    output tri1 id_4,
    input  wand id_5,
    output tri0 id_6,
    input  tri0 id_7,
    output wire id_8
);
  assign id_6 = id_7;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    input uwire id_2,
    input wand id_3,
    input wor id_4,
    input uwire id_5,
    output wire id_6,
    output tri id_7,
    input wand id_8,
    input supply1 id_9,
    input uwire id_10,
    output supply1 id_11,
    output wire id_12,
    output supply0 id_13,
    output supply0 id_14,
    input wire id_15,
    input tri1 id_16,
    input supply0 id_17
    , id_26,
    output wand id_18,
    input wor id_19,
    output wire id_20,
    output logic id_21,
    inout tri0 id_22,
    input wand id_23,
    output wand id_24
);
  assign id_13 = 1;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_7,
      id_7,
      id_20,
      id_2,
      id_20,
      id_8,
      id_14
  );
  assign modCall_1.id_8 = 0;
  always @(id_26[1]) begin : LABEL_0
    id_21 = #id_27 1'b0 ? id_27 : 1;
  end
endmodule
