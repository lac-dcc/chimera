// Seed: 303688634
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
    id_15
);
  output wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  id_16 :
  assert property (@(negedge -1'b0) -1'b0 ? id_9 : (-1'b0))
  else;
  logic id_17;
  assign id_16 = -1;
  parameter id_18 = -1;
endmodule
module module_1 #(
    parameter id_3 = 32'd90,
    parameter id_5 = 32'd95
) (
    input  tri0 id_0,
    input  tri0 id_1,
    output tri0 id_2,
    input  wor  _id_3
);
  assign #_id_5 id_2 = id_3;
  wire [id_5 : id_3] id_6;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  assign id_6 = id_1;
  wire id_7;
  id_8 :
  assert property (@(posedge "") id_6)
  else;
  wire id_9, id_10, id_11, id_12;
endmodule
