// Seed: 2575212526
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
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    module_0
);
  output wire id_26;
  inout wire id_25;
  inout wire id_24;
  inout wire id_23;
  inout wire id_22;
  input wire id_21;
  output wire id_20;
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  input wire id_16;
  assign module_1.id_2 = 0;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  localparam id_27 = 1 * -1 - 1;
  wire id_28;
endmodule
module module_1 #(
    parameter id_1 = 32'd15,
    parameter id_2 = 32'd96
) (
    _id_1,
    _id_2
);
  output wire _id_2;
  inout wire _id_1;
  logic [-1 'b0 : id_2] id_3;
  ;
  wire id_4;
  ;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  parameter [id_1 : 1] id_5 = 1 > 1;
  id_6 :
  assert property (@(posedge id_3 && 1) -1 || id_4 || id_5 || id_4)
  else $signed(46);
  ;
endmodule
