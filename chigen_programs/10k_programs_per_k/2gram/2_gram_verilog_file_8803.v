// Seed: 2570592355
module module_0 (
    input tri0 id_0,
    input tri id_1,
    output uwire id_2,
    output wor id_3
    , id_12,
    output tri1 id_4,
    input tri id_5,
    output uwire id_6,
    input wand id_7,
    input supply1 id_8,
    output tri1 id_9,
    output tri id_10
);
  assign id_12[1<""] = id_8;
  assign id_4 = 1;
  assign module_1.type_3 = 0;
  assign id_4 = 1;
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    output tri0 id_2,
    output uwire id_3,
    output wor id_4,
    input uwire id_5,
    input wire id_6,
    output uwire id_7,
    input supply0 id_8
);
  assign id_4 = id_1;
  nor primCall (id_4, id_1, id_6, id_5);
  module_0 modCall_1 (
      id_5,
      id_1,
      id_4,
      id_0,
      id_3,
      id_5,
      id_7,
      id_1,
      id_6,
      id_2,
      id_4
  );
endmodule
