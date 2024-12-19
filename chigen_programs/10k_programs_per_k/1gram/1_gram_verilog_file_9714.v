// Seed: 1296607477
module module_0 (
    input wor id_0,
    input tri0 id_1,
    output supply1 id_2,
    input wand id_3,
    input tri0 id_4,
    input wand id_5,
    input tri0 id_6,
    input uwire id_7,
    input wire id_8
);
  assign module_1.type_12 = 0;
endmodule
module module_1 (
    input  tri0 id_0,
    input  wire id_1,
    output wire id_2,
    input  tri0 id_3,
    input  tri1 id_4,
    input  wor  id_5,
    input  tri0 id_6
);
  uwire id_8, id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_8,
      id_9,
      id_5,
      id_3,
      id_6,
      id_1,
      id_3
  );
  assign id_2 = (id_9);
  wor id_10;
  always id_10 = 1;
endmodule
