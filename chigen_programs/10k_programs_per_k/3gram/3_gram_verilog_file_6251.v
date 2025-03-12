// Seed: 3238633901
module module_0 ();
  parameter id_1 = -1;
endmodule
module module_1 #(
    parameter id_4 = 32'd99
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  module_0 modCall_1 ();
  output wire id_3;
  output wire id_2;
  output logic [7:0] id_1;
  assign id_1[id_4] = id_4;
  wire id_5;
endmodule
module module_2 #(
    parameter id_10 = 32'd25,
    parameter id_11 = 32'd85,
    parameter id_14 = 32'd22,
    parameter id_15 = 32'd99,
    parameter id_17 = 32'd40,
    parameter id_18 = 32'd42,
    parameter id_3  = 32'd98,
    parameter id_8  = 32'd13
) (
    input tri0 id_0,
    input uwire id_1,
    output tri1 id_2,
    input wire _id_3,
    input tri id_4,
    input tri1 id_5,
    input tri id_6,
    input supply1 id_7,
    input tri _id_8,
    output uwire id_9,
    input tri1 _id_10,
    input tri0 _id_11,
    output tri0 id_12
);
  parameter id_14 = 1;
  module_0 modCall_1 ();
  parameter id_15 = 1;
  logic [7:0][id_15 : id_3] id_16;
  wire _id_17;
  wire [-1 : 1] _id_18;
  logic [7:0][1 : id_3  ?  -1 'b0 : id_11  ?  1 : 1  -  -1  ?  id_8 : id_17  ?  id_18 : 1] id_19;
  logic id_20 = -1;
  assign id_16[-1] = id_7;
  always_latch @(id_19[id_14#(.id_10(-1))]);
endmodule
