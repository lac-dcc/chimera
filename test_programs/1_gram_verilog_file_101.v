// Seed: 969723753
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3 = id_4;
  wire id_6;
  wire id_7;
  wire id_8;
  wire id_9;
  genvar id_10, id_11;
  wire id_12, id_13, id_14;
  assign id_11 = 1;
endmodule
module module_1;
  assign id_1 = 1;
  wire id_3 = id_3;
  wire id_4, id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4
  );
endmodule
module module_2 (
    output tri1 id_0,
    input  tri  id_1,
    input  wand id_2,
    input  wand id_3,
    id_5
);
  assign id_0 = id_1;
  wire id_6, id_7;
  uwire id_8 = {1{id_3}};
  module_0 modCall_1 (
      id_7,
      id_6,
      id_6,
      id_6,
      id_7
  );
  wand id_9, id_10, id_11;
  id_12 :
  assert property (@(~id_10) -1) id_11.id_1 = 1;
  assign id_0 = -1;
  wire id_13, id_14, id_15;
  initial $display(id_13);
endmodule
