// Seed: 200907830
module module_0 #(
    parameter id_7 = 32'd27,
    parameter id_9 = 32'd10
) (
    output wire id_0,
    output tri0 id_1,
    input  tri1 id_2,
    output tri1 id_3
);
  logic id_5;
  wire  id_6;
  wire  _id_7;
  logic [7:0] id_8, _id_9, id_10;
  wire id_11 = id_7;
  assign id_8[~&1'b0 : id_9] = 1'd0;
  wire [1  ^  id_7 : -1] id_12, id_13;
endmodule
module module_1 #(
    parameter id_1 = 32'd79,
    parameter id_2 = 32'd58
) (
    input wire id_0,
    output tri _id_1,
    input supply0 _id_2,
    output tri1 id_3,
    input tri id_4,
    output wire id_5
);
  union packed {
    logic id_7;
    logic id_8;
    logic id_9;
    logic id_10[-1 : id_2];
    logic id_11;
    logic id_12;
    logic [id_1 : -1] id_13[1 : -1] = 1;
  } id_14;
  ;
  logic id_15;
  always if (1) $unsigned(68);
  ;
  assign id_14.id_13 = id_14.id_9 | id_2;
  logic id_16;
  parameter id_17 = 1;
  always_ff id_16[-1][-1] = id_14.id_7;
  assign id_14.id_8 = 1;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_4,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
