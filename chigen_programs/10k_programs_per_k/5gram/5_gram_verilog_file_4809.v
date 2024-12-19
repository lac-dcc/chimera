// Seed: 2213724066
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input wand id_2,
    input tri0 id_3
);
  string id_5;
  assign module_1.type_14 = 0;
  assign id_5 = "";
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    input supply1 id_2,
    output tri1 id_3,
    input wor id_4,
    inout tri id_5,
    input supply1 id_6,
    input supply0 id_7,
    output wand id_8,
    output wire id_9,
    input wand id_10
);
  assign id_9 = 1;
  xnor primCall (id_9, id_7, id_2, id_1, id_0, id_10, id_4, id_6, id_5);
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_7
  );
endmodule
