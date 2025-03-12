// Seed: 50546137
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input tri1 id_2,
    input tri id_3,
    input wand id_4,
    input tri1 id_5,
    input wor id_6,
    input wor id_7
);
  assign id_0 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    output wor id_1,
    input wire id_2,
    input uwire id_3,
    input supply1 id_4,
    output supply1 id_5,
    input supply0 id_6,
    output tri id_7
);
  assign id_7 = 1;
  wire id_9;
  or primCall (id_1, id_6, id_0, id_9, id_3, id_2, id_4);
  module_0 modCall_1 (
      id_7,
      id_3,
      id_4,
      id_0,
      id_3,
      id_3,
      id_6,
      id_6
  );
  assign modCall_1.id_6 = 0;
endmodule
