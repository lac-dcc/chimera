// Seed: 1641530462
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  assign module_2.id_4 = 0;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_6 = id_5 - 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3
  );
  wire id_5;
endmodule
module module_2 (
    input tri1 id_0,
    output wire id_1,
    input tri id_2,
    output supply1 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input supply1 id_6,
    output wire id_7,
    input supply1 id_8
);
  wand id_10;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_10,
      id_10
  );
  assign id_10 = id_10 != 1;
  assign id_7  = id_10;
  nand primCall (id_1, id_0, id_10, id_6, id_2);
  assign id_3 = 1'b0;
endmodule
