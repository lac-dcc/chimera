// Seed: 4283124769
module module_0 (
    input tri1 id_0,
    input wand id_1,
    output uwire id_2,
    output supply0 id_3,
    output uwire id_4,
    input wand id_5,
    output tri1 id_6,
    input tri1 id_7,
    input tri1 id_8,
    input supply1 id_9
);
endmodule
module module_1 (
    output wor id_0,
    input wand id_1,
    input wor id_2,
    input uwire id_3,
    inout supply1 id_4,
    input tri id_5
);
  wand id_7 = -1;
  assign id_4 = id_7 / ~&id_4;
  wire id_8;
  supply1 id_9;
  assign id_9 = (!id_7) == id_4;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_0,
      id_4,
      id_3,
      id_0,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.id_9 = 0;
endmodule
