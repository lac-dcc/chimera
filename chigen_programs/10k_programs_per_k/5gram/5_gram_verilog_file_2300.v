// Seed: 4016457682
module module_0 (
    input supply0 id_0,
    input wire id_1,
    output uwire id_2,
    output tri id_3,
    input tri id_4,
    output supply1 id_5,
    input tri0 id_6,
    input wor id_7,
    output supply1 id_8,
    input wand id_9,
    input wire id_10,
    output wor id_11,
    output uwire id_12
);
  wire id_14;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    output tri id_2,
    output wor id_3,
    output supply1 id_4,
    output tri1 id_5,
    output tri1 id_6,
    output uwire id_7,
    input wor id_8,
    input tri1 id_9,
    output uwire id_10
);
  generate
    assign id_3 = id_1 ? 1 : 1;
  endgenerate
  module_0 modCall_1 (
      id_0,
      id_8,
      id_7,
      id_7,
      id_9,
      id_2,
      id_8,
      id_8,
      id_3,
      id_8,
      id_1,
      id_5,
      id_6
  );
endmodule
