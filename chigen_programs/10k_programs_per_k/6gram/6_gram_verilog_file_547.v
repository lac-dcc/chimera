// Seed: 1121557116
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
    id_16
);
  inout wire id_16;
  inout wire id_15;
  assign module_1.id_8 = 0;
  input wire id_14;
  input wire id_13;
  inout logic [7:0] id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  localparam id_17 = 1;
  wire [-1 'b0 : 1 'b0] id_18;
  parameter id_19 = (id_17);
  assign id_12[1] = id_16;
  uwire id_20 = -1'h0;
endmodule
module module_1 #(
    parameter id_2 = 32'd34,
    parameter id_3 = 32'd83,
    parameter id_6 = 32'd64,
    parameter id_7 = 32'd67,
    parameter id_8 = 32'd97
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5,
    _id_6,
    _id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  output logic [7:0] id_11;
  output wire id_10;
  input wire id_9;
  input wire _id_8;
  input wire _id_7;
  input wire _id_6;
  inout wire id_5;
  input wire id_4;
  inout wire _id_3;
  input wire _id_2;
  inout wire id_1;
  wire ["" : 1] id_13;
  logic [1 'h0 : id_6] id_14 = 1;
  logic [7:0][id_7  >  !  {  1  ,  1 'b0 ,  id_8  } : 1] id_15, id_16;
  module_0 modCall_1 (
      id_1,
      id_13,
      id_1,
      id_5,
      id_5,
      id_13,
      id_5,
      id_5,
      id_13,
      id_5,
      id_13,
      id_15,
      id_9,
      id_13,
      id_14,
      id_14
  );
  assign id_11[-1] = -1;
  assign id_15[{id_2==id_3}] = id_8;
endmodule
