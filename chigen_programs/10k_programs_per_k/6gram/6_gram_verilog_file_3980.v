// Seed: 3616378794
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    output tri1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    output supply1 id_5
    , id_27,
    input supply0 id_6,
    input tri0 id_7,
    input wor id_8,
    input tri0 id_9,
    output uwire id_10,
    input tri0 id_11,
    output uwire id_12,
    input tri1 id_13,
    output tri0 id_14,
    input supply1 id_15,
    output wor id_16,
    input supply1 id_17,
    input tri id_18,
    input tri1 id_19,
    input supply1 id_20,
    input wire id_21,
    output supply1 id_22,
    input tri0 id_23,
    input supply0 id_24,
    input supply1 id_25
);
  wand id_28, id_29, id_30 = 1'b0;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    output tri0  id_2,
    input  wand  id_3,
    input  wire  id_4,
    input  uwire id_5,
    input  wand  id_6,
    input  wor   id_7,
    output uwire id_8
);
  assign id_2 = 1;
  assign id_8 = 1;
  always id_0 <= #1 id_1;
  module_0 modCall_1 (
      id_8,
      id_3,
      id_8,
      id_3,
      id_5,
      id_8,
      id_6,
      id_6,
      id_3,
      id_4,
      id_8,
      id_5,
      id_2,
      id_6,
      id_2,
      id_6,
      id_2,
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_2,
      id_5,
      id_6,
      id_7
  );
  assign modCall_1.id_28 = 0;
endmodule
