// Seed: 2551682077
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    input tri1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    output supply1 id_5
);
  assign id_5 = 1;
  wire id_7;
endmodule
module module_1 (
    input wand id_0,
    output tri id_1,
    input tri1 id_2,
    input supply0 id_3,
    output wand id_4,
    input wor id_5,
    input wire id_6,
    output wire id_7,
    inout supply1 id_8,
    input tri1 id_9,
    output wire id_10,
    output wire id_11,
    input supply1 id_12
);
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_2,
      id_8
  );
  assign modCall_1.type_1 = 0;
  assign id_4 = id_5.id_12;
endmodule
