// Seed: 4088825262
module module_0 (
    input tri id_0,
    input tri0 id_1,
    output wire id_2,
    input tri1 id_3,
    input tri1 id_4,
    input supply0 id_5,
    output supply0 id_6,
    output tri id_7,
    input supply1 id_8,
    output supply1 id_9,
    input tri0 id_10,
    output tri id_11
    , id_27,
    output wand id_12,
    output supply0 id_13,
    output wire id_14,
    input supply0 id_15,
    input supply0 id_16,
    input tri id_17,
    output supply0 id_18,
    input tri id_19,
    output wire id_20,
    input wor id_21,
    output tri0 id_22,
    output tri1 id_23,
    input wire id_24,
    output supply1 id_25
);
  wire id_28;
endmodule
module module_1 (
    output tri id_0,
    input  tri id_1
);
  logic id_3;
  ;
  logic [7:0] id_4;
  ;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_12 = 0;
  always_latch @(negedge id_3 or posedge id_4[1'b0]) assume (-1'b0);
  parameter id_5 = -1;
endmodule
