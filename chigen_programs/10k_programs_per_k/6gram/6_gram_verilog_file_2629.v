// Seed: 1372782831
module module_0 (
    output tri1 id_0,
    output tri1 id_1,
    output tri0 id_2,
    input wor id_3,
    input supply0 id_4,
    output tri0 id_5,
    input supply0 id_6,
    input wand id_7,
    output supply1 id_8,
    input tri1 id_9,
    input wor id_10,
    output supply1 id_11,
    output supply0 id_12,
    input tri0 id_13,
    input supply1 id_14,
    output wire id_15,
    input wire id_16,
    input wor id_17,
    input supply0 id_18
    , id_24,
    output supply1 id_19,
    output tri id_20,
    input supply1 id_21,
    output wor id_22
);
  assign id_8 = -1'd0;
  assign id_2 = (id_9 - -1);
  parameter id_25 = -1;
  assign id_2 = 1;
  parameter id_26 = 1;
  assign id_12 = id_25;
  parameter id_27 = -1'b0;
  wire  id_28;
  logic id_29;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    inout  uwire id_1,
    output wor   id_2,
    output tri1  id_3
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_3,
      id_1,
      id_0
  );
  assign id_2 = id_1;
endmodule
