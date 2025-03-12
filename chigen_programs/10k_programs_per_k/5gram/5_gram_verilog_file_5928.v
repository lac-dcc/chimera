// Seed: 3433652954
module module_0 ();
  wire id_1;
  assign module_2.id_11 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd81,
    parameter id_7 = 32'd99
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5
);
  inout wire _id_5;
  input wire id_4;
  output logic [7:0] id_3;
  output logic [7:0] id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  wire id_6;
  wire [-1 'b0 : id_5] _id_7;
  assign id_2[id_7] = 1;
  assign id_2[-1==id_5] = 1;
endmodule
module module_2 #(
    parameter id_1  = 32'd81,
    parameter id_11 = 32'd6,
    parameter id_3  = 32'd15,
    parameter id_8  = 32'd57
) (
    _id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire _id_3;
  input wire id_2;
  module_0 modCall_1 ();
  output wire _id_1;
  logic [-1 : -1] _id_8 = -1;
  logic [1 'b0 : id_1  ==  1] id_9;
  ;
  localparam id_10 = 1 / 1'h0;
  wire [id_3 : id_8] _id_11;
  parameter id_12 = id_10[-1 : id_11];
  localparam id_13 = id_10;
  wire id_14 = id_8;
  or primCall (id_4, id_5, id_6, id_7);
endmodule
