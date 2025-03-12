// Seed: 2017396140
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    input supply1 id_2,
    output tri1 id_3,
    output wor id_4,
    input tri0 id_5,
    output uwire id_6,
    input tri0 id_7,
    input supply0 id_8,
    output supply1 id_9
);
  module_2 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_9,
      id_9
  );
  assign modCall_1.id_2 = 0;
  assign module_1.id_5  = 0;
endmodule
module module_1 (
    output uwire id_0,
    output supply0 id_1,
    input wor id_2,
    output uwire id_3,
    output tri0 id_4,
    output wand id_5
);
  not primCall (id_5, id_2);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_0,
      id_2,
      id_4,
      id_2,
      id_2,
      id_5
  );
endmodule
module module_2 (
    input uwire id_0,
    output wand id_1,
    input wand id_2,
    output supply1 id_3,
    output supply0 id_4
);
  wire id_6;
endmodule
