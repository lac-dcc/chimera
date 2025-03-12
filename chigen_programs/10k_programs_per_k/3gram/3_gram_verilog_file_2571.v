// Seed: 1706225046
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  assign module_1.id_21 = 0;
  inout wire id_2;
  input wire id_1;
  parameter id_5 = (-1);
  assign id_3 = id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd22,
    parameter id_7 = 32'd58
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  output logic [7:0] id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  module_0 modCall_1 (
      id_5,
      id_13,
      id_5,
      id_4
  );
  inout wire _id_7;
  output wire id_6;
  xor primCall (id_4, id_14, id_13, id_3, id_8, id_2, id_15, id_5, id_12);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire _id_1;
  assign id_19[id_7 : 1'b0+(id_1)] = -1;
  logic [1 'b0 : 1] id_20 = 1;
  id_21 :
  assert property (@(negedge id_3) 1)
  else $signed(92);
  ;
endmodule
