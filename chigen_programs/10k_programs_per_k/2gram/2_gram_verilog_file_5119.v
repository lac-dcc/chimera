// Seed: 4255761696
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_12 = 32'd58,
    parameter id_25 = 32'd52,
    parameter id_30 = 32'd33
) (
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
    _id_12,
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
    _id_25,
    id_26,
    id_27,
    id_28
);
  input wire id_28;
  input wire id_27;
  input wire id_26;
  input wire _id_25;
  inout wire id_24;
  output wire id_23;
  inout wire id_22;
  output wire id_21;
  output wire id_20;
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  inout logic [7:0] id_14;
  input wire id_13;
  input wire _id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout supply1 id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_24,
      id_11,
      id_4,
      id_9,
      id_10,
      id_21,
      id_22,
      id_8,
      id_19
  );
  input wire id_2;
  input wire id_1;
  logic id_29;
  assign id_7 = 1;
  _id_30 :
  assert property (@(posedge id_14[-1] or id_30 <-> id_14) 1)
  else;
  wire [1 'b0 : id_12] id_31, id_32, id_33, id_34;
  supply1 [id_30 : id_25] id_35;
  assign id_35 = 1;
endmodule
