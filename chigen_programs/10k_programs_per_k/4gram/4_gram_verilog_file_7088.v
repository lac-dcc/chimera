// Seed: 515135363
module module_0;
  logic id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd18,
    parameter id_5 = 32'd87
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  input wire id_10;
  module_0 modCall_1 ();
  output reg id_9;
  inout logic [7:0] id_8;
  output wire id_7;
  input wire id_6;
  input wire _id_5;
  inout wire _id_4;
  output wire id_3;
  output wire id_2;
  or primCall (id_1, id_10, id_11, id_6, id_8);
  output wire id_1;
  always @(negedge -1) id_9 = id_8[id_4.id_5];
endmodule
