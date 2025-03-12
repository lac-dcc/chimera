// Seed: 184118083
module module_0 (
    output wire id_0,
    output wire id_1,
    input supply1 id_2,
    output wire id_3,
    input wand id_4,
    output tri0 id_5,
    input wor id_6,
    input supply1 id_7,
    input tri id_8
);
  wire id_10;
  ;
  wire id_11;
  assign module_1.id_0 = 0;
  wire id_12;
endmodule
module module_1 (
    output tri  id_0,
    input  tri0 id_1,
    input  tri  id_2,
    input  wor  id_3,
    input  tri1 id_4,
    input  tri0 id_5,
    input  tri  id_6,
    output wire id_7
);
  nor primCall (id_7, id_4, id_2, id_5, id_1);
  module_0 modCall_1 (
      id_7,
      id_0,
      id_5,
      id_0,
      id_6,
      id_7,
      id_5,
      id_6,
      id_3
  );
endmodule
