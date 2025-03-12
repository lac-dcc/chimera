// Seed: 2897680977
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_0  = 32'd18,
    parameter id_17 = 32'd28,
    parameter id_19 = 32'd88,
    parameter id_5  = 32'd69
) (
    input tri1 _id_0,
    output tri0 id_1,
    input wire id_2,
    input tri0 id_3,
    input supply1 id_4,
    input tri0 _id_5,
    input wor id_6,
    input uwire id_7,
    input tri id_8,
    input tri0 id_9,
    input tri id_10,
    input wor id_11,
    output tri0 id_12,
    input tri0 id_13,
    output logic id_14,
    output wire id_15
);
  wire _id_17, id_18, _id_19, id_20;
  wire id_21;
  parameter id_22 = 1;
  nand primCall (id_14, id_20, id_10, id_21, id_13, id_2, id_22, id_18, id_8, id_3, id_9, id_6);
  module_0 modCall_1 (
      id_18,
      id_21,
      id_20,
      id_21,
      id_21,
      id_20,
      id_20,
      id_20
  );
  logic id_23 = id_11;
  assign id_19 = id_3;
  always
    if (id_22.id_22[id_19<->id_19 :-1+id_5-id_0][-1'd0][id_17 : 1'h0]) id_14 = id_19;
    else id_23 <= id_22;
endmodule
