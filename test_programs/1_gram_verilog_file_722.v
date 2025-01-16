// Seed: 2464084245
module module_0 (
    input tri1  id_0,
    input tri   id_1,
    input uwire id_2,
    input wire  id_3,
    input wand  id_4,
    input tri0  id_5,
    input tri   id_6
);
  bit id_8;
  supply0 id_9;
  wire id_10;
  assign id_9 = 1'b0;
  initial id_8 <= -1;
  wire id_11;
  wire id_12;
  wire id_13;
  assign module_1.id_3 = 0;
  wire id_14, id_15 = 1;
endmodule
module module_1 (
    input  uwire id_0,
    output tri0  id_1,
    input  wire  id_2,
    input  tri0  id_3,
    input  tri   id_4
);
  wire id_6;
  genvar id_7;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_2,
      id_3,
      id_0,
      id_4
  );
  wire id_8;
  wire id_9;
  wire id_10, id_11;
endmodule
