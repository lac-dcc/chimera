// Seed: 771563547
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
    id_20
);
  inout wire id_20;
  input wire id_19;
  input wire id_18;
  output wire id_17;
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  inout logic [7:0] id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  id_21(
      1, id_21
  );
  assign id_9 = id_19;
  if (-1) assign id_9 = id_14;
  else begin : LABEL_0
    wire id_22;
    ;
  end
  wire id_23, id_24, id_25, id_26, id_27;
endmodule
module module_1 #(
    parameter id_16 = 32'd58,
    parameter id_4  = 32'd54
) (
    id_1,
    id_2,
    id_3,
    _id_4,
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
    _id_16
);
  inout wire _id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout logic [7:0] id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire _id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_10[id_4 : id_16] = id_5;
  parameter id_17 = 1;
  module_0 modCall_1 (
      id_1,
      id_12,
      id_12,
      id_14,
      id_9,
      id_17,
      id_1,
      id_3,
      id_12,
      id_5,
      id_10,
      id_11,
      id_7,
      id_8,
      id_17,
      id_12,
      id_1,
      id_2,
      id_3,
      id_5
  );
endmodule
