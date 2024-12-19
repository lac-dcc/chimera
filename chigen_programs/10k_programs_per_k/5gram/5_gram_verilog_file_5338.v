// Seed: 1934599452
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input wor id_2,
    input supply1 id_3,
    inout uwire id_4,
    input tri1 id_5,
    input wire id_6,
    input tri0 id_7,
    input supply0 id_8,
    input wire id_9,
    input supply0 id_10,
    input wand id_11,
    output supply0 id_12,
    input tri id_13
);
  assign id_4 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    inout supply0 id_1,
    input supply1 id_2,
    input wire id_3,
    output wire id_4,
    input tri0 id_5,
    input wire id_6,
    output wire id_7,
    output supply0 id_8,
    input supply1 id_9,
    output tri id_10,
    input wand id_11
);
  module_0 modCall_1 (
      id_10,
      id_0,
      id_9,
      id_5,
      id_1,
      id_5,
      id_5,
      id_9,
      id_11,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.type_5 = 0;
  wire id_13;
  wire id_14 = ~(1);
endmodule
