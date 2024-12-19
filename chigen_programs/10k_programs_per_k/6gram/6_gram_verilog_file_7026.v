// Seed: 1740576361
module module_0 ();
  assign id_1 = 1;
endmodule
module module_1 ();
  supply1 id_1 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  uwire id_2;
  assign id_2 = 1;
  wire id_3;
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
    id_11
);
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_12;
  assign id_3 = id_8;
  wire id_13;
  assign id_8[1] = id_5 == id_4;
  initial $display(1);
  module_0 modCall_1 ();
  wire id_14;
  nor primCall (id_1, id_10, id_11, id_12, id_13, id_4, id_5, id_6, id_8);
  wire id_15;
  assign id_9 = id_13;
endmodule
