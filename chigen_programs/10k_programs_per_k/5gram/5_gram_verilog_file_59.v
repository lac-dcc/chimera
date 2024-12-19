// Seed: 1155694926
module module_0 (
    input uwire id_0,
    input wire id_1,
    input tri0 id_2,
    input supply0 id_3,
    output supply0 id_4,
    output supply0 id_5,
    input wor id_6,
    output tri0 id_7,
    input uwire id_8,
    input uwire id_9,
    input wor module_0,
    input supply0 id_11,
    output supply0 id_12,
    output wand id_13,
    output supply1 id_14
);
  supply1 id_16, id_17 = 1;
  assign id_4 = 'b0;
  wire id_18;
endmodule
module module_1 (
    input wire id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wor id_3,
    output wire id_4,
    input uwire id_5,
    output tri id_6,
    input tri id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_4,
      id_4,
      id_5,
      id_6,
      id_3,
      id_2,
      id_1,
      id_0,
      id_6,
      id_6,
      id_6
  );
  assign modCall_1.id_6 = 0;
endmodule
