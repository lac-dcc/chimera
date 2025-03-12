// Seed: 3060253231
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  assign module_1.id_21 = 0;
  assign id_5 = id_6;
endmodule
module module_1 #(
    parameter id_15 = 32'd47,
    parameter id_17 = 32'd23,
    parameter id_18 = 32'd87,
    parameter id_2  = 32'd31
) (
    id_1,
    _id_2,
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
    _id_17,
    _id_18,
    id_19,
    id_20
);
  output wire id_20;
  input wire id_19;
  inout wire _id_18;
  output wire _id_17;
  inout wire id_16;
  inout wire _id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output logic [7:0] id_4;
  output wire id_3;
  input wire _id_2;
  module_0 modCall_1 (
      id_19,
      id_11,
      id_16,
      id_11,
      id_5,
      id_8
  );
  output wire id_1;
  assign id_1 = id_10;
  supply1 [id_2 : 'b0] id_21 = id_18 ? {id_8, id_16} == "" : 1;
  assign id_13 = id_21#(
      .id_15(1'b0),
      .id_16(1 + 1)
  );
  parameter id_22 = -1;
  assign id_5 = id_18;
  assign id_8 = id_2;
  logic [id_17 : id_15] id_23;
  ;
endmodule
