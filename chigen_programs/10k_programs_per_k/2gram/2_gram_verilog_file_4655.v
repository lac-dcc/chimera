// Seed: 3411723794
module module_0 (
    id_1
);
  inout supply1 id_1;
  assign id_1 = 1;
  always $unsigned(13);
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd60,
    parameter id_6 = 32'd42
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire _id_6;
  module_0 modCall_1 (id_8);
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire _id_2;
  inout wire id_1;
  assign id_7 = id_2;
  id_13 :
  assert property (@(posedge id_5) id_12)
  else;
  logic id_14;
  wire  id_15;
  parameter id_16 = -1;
  wire  id_17;
  logic id_18;
  ;
  wire [id_2 : -1  ^  id_6  ?  !  -1 : id_6] id_19;
  generate
    wire id_20;
    ;
  endgenerate
endmodule
