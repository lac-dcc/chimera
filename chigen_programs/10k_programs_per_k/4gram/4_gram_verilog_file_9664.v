// Seed: 1455212878
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign module_1.type_10 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output wire  id_1,
    input  wand  id_2,
    input  tri0  id_3,
    input  wor   id_4
);
  wire id_6, id_7;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_6,
      id_7
  );
  initial $display("");
  nand primCall (id_1, id_8, id_2, id_6);
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3
  );
endmodule
