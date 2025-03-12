// Seed: 3561191639
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
    id_18
);
  output wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  output uwire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_14 = id_9 + -1;
endmodule
module module_1 #(
    parameter id_15 = 32'd57,
    parameter id_18 = 32'd29,
    parameter id_23 = 32'd36
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
    id_12,
    id_13,
    id_14,
    _id_15,
    id_16,
    id_17,
    _id_18,
    id_19,
    id_20,
    id_21
);
  output wire id_21;
  inout wire id_20;
  output wire id_19;
  input wire _id_18;
  input wire id_17;
  output wire id_16;
  module_0 modCall_1 (
      id_1,
      id_11,
      id_6,
      id_5,
      id_3,
      id_11,
      id_2,
      id_16,
      id_17,
      id_3,
      id_9,
      id_2,
      id_20,
      id_11,
      id_1,
      id_11,
      id_19,
      id_13
  );
  inout wire _id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4[-1] = -1;
  reg   id_22;
  tri1  _id_23 = -1;
  logic id_24;
  id_25 :
  assert property (@(id_20) -1)
  else begin : LABEL_0
    id_22 = 1;
    id_24 = id_12;
  end
  assign id_1 = id_25;
  logic [id_23  &&  id_15 : id_18] id_26;
  ;
endmodule
