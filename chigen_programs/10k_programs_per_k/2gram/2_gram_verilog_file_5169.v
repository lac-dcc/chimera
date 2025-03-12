// Seed: 3425677164
module module_0;
  localparam id_1 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd37,
    parameter id_9 = 32'd37
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11
);
  input wire id_11;
  inout wire id_10;
  input wire _id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire _id_4;
  input wire id_3;
  xnor primCall (id_10, id_11, id_2, id_3, id_5, id_6, id_7, id_8);
  input wire id_2;
  input wire id_1;
  assign id_10 = id_11;
  module_0 modCall_1 ();
  assign id_6 = id_3;
  wire [id_4  ?  1 'b0 : 1 : id_9] id_12;
endmodule
