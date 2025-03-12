// Seed: 844253445
module module_0 #(
    parameter id_8 = 32'd82
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input logic [7:0] id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5, id_6;
  localparam id_7 = -1;
  assign id_1 = id_3[-1'b0];
  wire _id_8, id_9;
  wire [id_8 : 1] id_10, id_11, id_12;
  wire id_13;
  ;
endmodule
module module_1 #(
    parameter id_1  = 32'd18,
    parameter id_21 = 32'd70,
    parameter id_3  = 32'd85,
    parameter id_5  = 32'd92,
    parameter id_6  = 32'd80
) (
    _id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    _id_6,
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
    id_17[id_1 : ""],
    id_18,
    id_19[id_5 : 1&1+id_3],
    id_20,
    _id_21
);
  input wire _id_21;
  input wire id_20;
  inout logic [7:0] id_19;
  inout wire id_18;
  inout logic [7:0] id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  nand primCall (
      id_19, id_11, id_8, id_10, id_2, id_15, id_14, id_13, id_17, id_9, id_18, id_7, id_16
  );
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire _id_6;
  inout wire _id_5;
  output wire id_4;
  inout wire _id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_16,
      id_18,
      id_19,
      id_15
  );
  inout wire _id_1;
  wire [id_6 : id_21] id_22;
endmodule
