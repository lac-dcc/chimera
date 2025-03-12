// Seed: 3978434921
module module_0 #(
    parameter id_3 = 32'd59,
    parameter id_6 = 32'd63,
    parameter id_7 = 32'd26
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    _id_6,
    _id_7
);
  inout wire _id_7;
  input wire _id_6;
  input wire id_5;
  input wire id_4;
  inout wire _id_3;
  output wire id_2;
  output wire id_1;
  struct packed {logic [-1 : id_3] id_8;} [1 : id_6  |  id_7] id_9;
  ;
endmodule
module module_1 #(
    parameter id_6 = 32'd29,
    parameter id_7 = 32'd63,
    parameter id_8 = 32'd0
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout tri id_3;
  input wire id_2;
  input wire id_1;
  tri1 id_5 = 1;
  parameter id_6 = -1;
  wire _id_7 = id_5;
  assign id_3 = 1;
  parameter [id_7 : id_7] id_8 = -1'b0;
  supply1 id_9 = 1;
  defparam id_8.id_6 = id_8; id_10 :
  assert property (@(1) id_9 == id_10)
  else disable id_11;
  localparam id_12 = id_6;
  assign id_9 = -1;
  initial begin : LABEL_0
    id_10 = -1;
  end
  assign id_11 = id_1;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_6,
      id_9,
      id_9,
      id_8,
      id_8
  );
endmodule
