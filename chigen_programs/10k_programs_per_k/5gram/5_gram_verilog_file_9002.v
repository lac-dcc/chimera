// Seed: 2260169952
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input tri1 id_2,
    input wand id_3,
    output wor id_4,
    input tri0 id_5,
    output wire id_6
);
  wire id_8;
  assign module_1.id_0 = 0;
  logic id_9;
endmodule
module module_1 (
    input  tri1  id_0,
    output tri0  id_1,
    output uwire id_2,
    input  tri0  id_3,
    input  uwire id_4,
    input  wire  id_5,
    input  tri0  id_6,
    output uwire id_7
);
  wire id_9;
  or primCall (id_7, id_0, id_3, id_9, id_4);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_0,
      id_7,
      id_3,
      id_7
  );
endmodule
