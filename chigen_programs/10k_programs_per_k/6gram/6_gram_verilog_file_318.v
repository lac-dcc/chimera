// Seed: 1224221107
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout supply1 id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = 1;
endmodule
module module_1 #(
    parameter id_12 = 32'd54,
    parameter id_18 = 32'd43,
    parameter id_6  = 32'd98,
    parameter id_9  = 32'd86
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    _id_12,
    id_13
);
  inout wire id_13;
  inout wire _id_12;
  inout wire id_11;
  inout wire id_10;
  input wire _id_9;
  inout wire id_8;
  inout reg id_7;
  output wire _id_6;
  inout tri id_5;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_10,
      id_8
  );
  input wire id_4;
  output supply0 id_3;
  output tri0 id_2;
  inout wire id_1;
  logic [-1  ^  id_6 : id_6] id_14;
  logic [1 : id_12] id_15;
  logic [-1  &  1 : 1 'b0] id_16;
  wire id_17;
  ;
  always id_7 <= #id_14 -1;
  assign #_id_18 id_5 = id_13 - id_9;
  assign id_3 = -1;
  logic id_19 = id_9;
  wire  id_20;
  assign id_14 = (1) & id_17;
  assign id_19 = 1;
  assign id_2  = 1;
  initial begin : LABEL_0
    fork
      id_21;
    join_any
    disable id_22;
  end
  assign id_7 = -1 ? id_8 : id_17 == id_1;
  logic [id_18 : !  id_9] id_23 = id_23 ~^ 1, id_24 = id_17;
endmodule
