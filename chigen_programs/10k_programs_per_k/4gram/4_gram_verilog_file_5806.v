// Seed: 202561582
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output wand id_2,
    output tri1 id_3,
    input wor id_4,
    input tri id_5,
    input supply1 id_6,
    output supply0 id_7,
    output tri id_8,
    input wire id_9,
    input wand id_10
);
  wire id_12;
  module_2 modCall_1 (
      id_10,
      id_4,
      id_9,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output supply0 id_1,
    output wand id_2
);
  wire id_4 = id_0;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_1,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.id_1 = 0;
  assign id_1 = id_4;
  xnor primCall (id_1, id_0, id_4);
endmodule
module module_2 (
    input tri1 id_0,
    input supply1 id_1,
    input tri id_2,
    input wire id_3
);
  assign id_5 = 1;
  wire id_6;
endmodule
