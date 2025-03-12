// Seed: 4277858880
module module_0 (
    input tri id_0,
    input supply1 id_1,
    input uwire id_2,
    output tri0 id_3,
    input supply1 id_4,
    output wor id_5,
    output wor id_6,
    output supply1 id_7,
    input wor id_8
);
endmodule
module module_1 (
    output uwire id_0,
    input  tri1  id_1,
    input  wire  id_2,
    input  tri0  id_3,
    output tri1  id_4,
    input  tri0  id_5,
    output tri0  id_6
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_0,
      id_5,
      id_0,
      id_6,
      id_0,
      id_2
  );
  assign modCall_1.id_7 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = id_1;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  module_2 modCall_1 (
      id_2,
      id_6,
      id_6
  );
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  nand primCall (id_6, id_5, id_7, id_1, id_2, id_3);
  input wire id_1;
endmodule
