// Seed: 611896856
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  genvar id_5;
  assign module_2.type_14 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_5,
      id_5
  );
endmodule
module module_2 (
    input  wand id_0,
    input  tri0 id_1,
    input  wand id_2,
    input  tri1 id_3,
    input  tri1 id_4,
    output tri0 id_5
);
  wire id_7, id_8, id_9;
  wire id_10;
  time id_11 (
      .id_0(1),
      .id_1(1),
      .id_2(1),
      .id_3("" & id_10)
  );
  xnor primCall (id_5, id_0, id_10, id_9, id_12, id_3, id_7, id_2);
  uwire id_12 = id_0;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_8
  );
endmodule
