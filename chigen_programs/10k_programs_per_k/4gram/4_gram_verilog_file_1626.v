// Seed: 863400781
module module_0 #(
    parameter id_5 = 32'd36
) (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
  assign module_1.id_6 = 0;
  wire _id_5;
  wire [id_5 : -1] id_6;
endmodule
module module_1 #(
    parameter id_2 = 32'd38,
    parameter id_6 = 32'd6,
    parameter id_9 = 32'd40
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  input wire _id_6;
  input logic [7:0] id_5;
  input wire id_4;
  inout wire id_3;
  inout wire _id_2;
  inout wire id_1;
  wire _id_9;
  ;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1
  );
  logic [-1 : id_6] id_10;
  id_11 :
  assert property (@(posedge 1) id_2)
  else $clog2(21);
  ;
  wire  [ 1 : id_9] id_12;
  logic [-1 : id_2] id_13;
  ;
  generate
    string id_14 = "", id_15, id_16;
  endgenerate
endmodule
