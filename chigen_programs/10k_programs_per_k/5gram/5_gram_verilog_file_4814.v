// Seed: 2658186557
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
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
    id_19,
    id_20,
    module_0,
    id_22
);
  inout wire id_22;
  output wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  parameter id_23 = -1'h0;
  wire id_24;
endmodule
module module_1 #(
    parameter id_1 = 32'd29
) (
    _id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire _id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2
  );
  id_4 :
  assert property (@(posedge id_4[id_1 : 1]) id_1)
  else $signed(68);
  ;
endmodule
