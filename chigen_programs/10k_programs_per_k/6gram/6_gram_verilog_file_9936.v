// Seed: 1471968723
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
    id_10
);
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_11;
endmodule
module module_1 #(
    parameter id_14 = 32'd27,
    parameter id_2  = 32'd50
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
    id_12
);
  input wire id_12;
  inout supply1 id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  module_0 modCall_1 (
      id_12,
      id_8,
      id_10,
      id_12,
      id_8,
      id_10,
      id_11,
      id_8,
      id_3,
      id_11
  );
  inout logic [7:0] id_5;
  input wire id_4;
  input wire id_3;
  inout wire _id_2;
  input wire id_1;
  assign id_11 = -1 ? 1 : id_5[id_2] && 1;
  wire [-1 : 1 'd0] id_13;
  logic _id_14;
  ;
  wire [1 : id_14  +  1] id_15;
  logic id_16;
  initial begin : LABEL_0
    id_16 <= id_14;
  end
endmodule
