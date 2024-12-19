// Seed: 3029032506
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input wand id_2,
    output wire id_3,
    input wor id_4
);
  wire id_6;
endmodule
module module_1 (
    input wire id_0,
    output tri id_1,
    input tri id_2,
    output wire id_3,
    input wand id_4,
    input wand id_5,
    input wand id_6,
    input supply0 id_7,
    input tri0 id_8
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_4,
      id_3,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 (
    input wor id_0,
    output supply1 id_1,
    output tri1 id_2,
    input tri1 id_3,
    input supply0 id_4,
    output tri1 id_5,
    input wor id_6,
    input supply0 id_7,
    output wor id_8
);
  module_0 modCall_1 (
      id_5,
      id_3,
      id_4,
      id_8,
      id_3
  );
  assign modCall_1.id_0 = 0;
  assign id_5 = 1;
endmodule
