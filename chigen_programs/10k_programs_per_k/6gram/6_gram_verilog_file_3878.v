// Seed: 4270383000
module module_0 (
    output wor id_0,
    output wor id_1,
    input supply1 id_2
    , id_10,
    input tri0 id_3,
    output uwire id_4,
    output wire id_5,
    input tri1 id_6,
    input tri0 id_7,
    output tri1 id_8
);
  assign id_8 = 1;
  reg id_11, id_12;
  wire id_13;
  always @(posedge 1 & 1'd0) id_12 = #1 1;
endmodule
module module_1 (
    input logic id_0,
    output tri id_1,
    input wire id_2,
    input tri0 id_3,
    input supply0 id_4,
    output wire id_5,
    input wor id_6,
    input wor id_7,
    input logic id_8,
    output wire id_9,
    output tri id_10,
    input tri0 id_11,
    input tri id_12,
    output wor id_13,
    input tri1 id_14,
    output tri0 id_15,
    input tri id_16,
    input wand id_17,
    input logic id_18,
    output supply0 id_19,
    output supply0 id_20,
    input supply1 id_21,
    output supply1 id_22,
    input wire id_23
);
  wire id_25;
  module_0 modCall_1 (
      id_20,
      id_9,
      id_3,
      id_12,
      id_22,
      id_9,
      id_2,
      id_17,
      id_9
  );
  assign modCall_1.type_0 = 0;
  reg id_26;
  xor primCall (
      id_9, id_7, id_6, id_17, id_3, id_11, id_12, id_18, id_2, id_0, id_8, id_21, id_25, id_14
  );
  always id_26 = #1 id_0;
  always disable id_27;
endmodule
