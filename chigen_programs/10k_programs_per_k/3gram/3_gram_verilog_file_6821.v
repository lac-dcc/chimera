// Seed: 2278289637
module module_0 (
    input  tri1  id_0,
    input  wire  id_1,
    output tri1  id_2,
    output uwire id_3,
    input  wand  id_4
);
  wire id_6;
  assign module_1.id_2 = 0;
  tri1 id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16 = id_1;
endmodule
module module_1 (
    input supply0 id_0,
    input wand id_1,
    output wire id_2,
    input tri0 id_3,
    output uwire id_4,
    input tri id_5,
    output supply1 id_6,
    input tri0 id_7
);
  wire id_9;
  xnor primCall (id_4, id_9, id_0, id_7, id_1);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_2,
      id_5
  );
endmodule
