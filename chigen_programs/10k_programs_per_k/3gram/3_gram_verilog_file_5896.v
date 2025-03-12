// Seed: 1458547835
module module_0;
  logic id_1;
  ;
  time id_2;
  ;
endmodule
module module_1 ();
  wire id_1;
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_7 = 32'd28
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  inout logic [7:0] id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  module_0 modCall_1 ();
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire _id_7;
  input wire id_6;
  input wire id_5;
  output reg id_4;
  output logic [7:0] id_3;
  input wire id_2;
  input logic [7:0] id_1;
  assign id_17[1'b0] = -1;
  wire id_18 = id_15;
  id_19 :
  assert property (@(posedge !id_11) 1)
  else id_3[id_7] = -1;
  assign id_12 = id_1;
  always @(*) if (1) id_4 = id_9;
  assign id_17 = !id_1[1];
  wire id_20 = id_14 ? id_7 : id_18;
  assign id_18 = (1);
endmodule
