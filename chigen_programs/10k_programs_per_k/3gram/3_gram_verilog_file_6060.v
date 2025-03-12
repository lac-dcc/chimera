// Seed: 3725419688
module module_0;
  logic id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd20,
    parameter id_5 = 32'd24
) (
    input supply0 id_0,
    input supply1 id_1,
    input uwire   _id_2
);
  wire [1 : 1] id_4;
  logic _id_5;
  logic id_6;
  module_0 modCall_1 ();
  logic id_7;
  ;
  parameter id_8 = "";
  logic [-1 : id_2] id_9;
  assign id_9 = id_6[id_5];
endmodule
module module_2 (
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
    id_15,
    id_16,
    id_17
);
  output wire id_17;
  input wire id_16;
  output wire id_15;
  output reg id_14;
  input wire id_13;
  module_0 modCall_1 ();
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    id_14 = #1 -1;
    cover (1);
  end
endmodule
