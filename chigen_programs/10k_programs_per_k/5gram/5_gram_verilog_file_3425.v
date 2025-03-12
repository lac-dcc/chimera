// Seed: 2930235979
module module_0 ();
  uwire id_1;
  assign id_1 = -1 - id_1;
  assign module_2._id_3 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd43
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout logic [7:0] id_4;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  input wire _id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = id_1;
  assign id_4[1 : id_3] = 1;
endmodule
module module_2 #(
    parameter id_2 = 32'd62,
    parameter id_3 = 32'd75,
    parameter id_4 = 32'd88
) (
    output tri0  id_0,
    input  wire  id_1,
    input  tri0  _id_2,
    input  uwire _id_3,
    input  uwire _id_4,
    input  tri0  id_5,
    input  tri1  id_6
);
  wire  [id_3 : id_4] id_8;
  logic [  -1 : id_2] id_9 = id_8;
  or primCall (id_0, id_1, id_5, id_6, id_8, id_9);
  module_0 modCall_1 ();
endmodule
