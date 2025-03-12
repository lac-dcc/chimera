// Seed: 629769592
module module_0 #(
    parameter id_9 = 32'd39
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8#(._id_9(id_10)),
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout tri1 id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire _id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output tri0 id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = -1'b0;
  wire [-1 : (  id_9  ^  id_9  )] id_16;
  logic id_17 = -1 - -1;
  assign id_13 = -1;
  wire id_18;
  assign module_1.id_26 = 0;
endmodule
module module_1 #(
    parameter id_11 = 32'd8,
    parameter id_17 = 32'd15,
    parameter id_2  = 32'd40,
    parameter id_20 = 32'd49,
    parameter id_4  = 32'd96,
    parameter id_8  = 32'd23,
    parameter id_9  = 32'd18
) (
    output tri  id_0,
    input  tri0 id_1,
    input  wor  _id_2
);
  assign id_0 = -1;
  assign id_0 = id_2 & id_1;
  logic [7:0][(  id_2  ) : id_2]
      _id_4,
      id_5,
      id_6,
      id_7,
      _id_8,
      _id_9,
      id_10,
      _id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      _id_17,
      id_18,
      id_19,
      _id_20,
      id_21,
      id_22,
      id_23,
      id_24;
  localparam id_25 = 1, id_26 = 1;
  assign id_14[id_11 : id_20] = 1;
  module_0 modCall_1 (
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_25,
      id_26,
      id_25,
      id_25,
      id_25,
      id_25
  );
  struct packed {
    id_27 id_28;
    logic id_29;
  } [id_4 : id_8  -  1 'b0] id_30;
  wire id_31;
endmodule
