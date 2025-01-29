// Seed: 1964154954
module module_0 (
    input wand id_0,
    input wire id_1,
    input supply1 id_2,
    input wor id_3,
    input tri1 id_4,
    output wor id_5,
    input wire id_6,
    output uwire id_7,
    input wor id_8,
    output tri0 id_9,
    output tri1 id_10,
    output tri id_11,
    output supply1 id_12,
    input tri0 id_13,
    output supply0 id_14,
    id_17,
    input tri id_15
);
  parameter id_18 = 1;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    input uwire id_2,
    input logic id_3,
    output logic id_4,
    input tri0 id_5,
    output logic id_6,
    input supply1 id_7,
    output tri1 id_8,
    input tri id_9,
    output wire id_10,
    input supply1 id_11,
    output supply0 id_12
);
  logic id_14;
  parameter id_15 = id_15[-1|1] * {id_5, id_3, 1'b0};
  assign id_14 = !id_9;
  assign id_8  = id_0;
  parameter id_16 = -1;
  always_ff id_6 <= id_3;
  initial begin : LABEL_0
    id_4.id_3 = id_14;
  end
  module_0 modCall_1 (
      id_9,
      id_5,
      id_2,
      id_5,
      id_1,
      id_8,
      id_11,
      id_12,
      id_0,
      id_8,
      id_12,
      id_8,
      id_12,
      id_11,
      id_12,
      id_11
  );
  assign modCall_1.type_5 = 0;
  assign id_6 = 1;
  always
  `define pp_17 0
endmodule
