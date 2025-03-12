// Seed: 3088871401
module module_0;
  wire id_1;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2
);
  output logic [7:0] id_2;
  input wire id_1;
  assign id_2[1] = -1;
  module_0 modCall_1 ();
endmodule
module module_3 #(
    parameter id_3 = 32'd51,
    parameter id_6 = 32'd83,
    parameter id_7 = 32'd93
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    _id_6,
    _id_7,
    id_8
);
  output wire id_8;
  output wire _id_7;
  inout wire _id_6;
  output wire id_5;
  input wire id_4;
  input wire _id_3;
  input wire id_2;
  output wire id_1;
  logic id_9;
  logic [id_7 : id_6  -  1] id_10;
  ;
  localparam id_11 = 1;
  wire  id_12 [id_3 : 1];
  logic id_13;
  ;
  wire id_14;
  module_0 modCall_1 ();
  logic id_15;
  logic id_16;
  wire  id_17;
  logic id_18 = id_12 < -1;
  logic id_19;
  ;
  logic [-1 'h0 : -1] id_20 = id_17;
  assign id_19 = 1'd0;
  always @(*) id_16 <= id_11 & -1;
  logic id_21;
  logic id_22;
  assign id_8 = id_21;
endmodule
