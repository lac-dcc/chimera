// Seed: 3448306995
module module_0 (
    input tri0 id_0,
    input tri id_1,
    input tri id_2,
    input wire id_3,
    input wire id_4,
    output supply1 id_5,
    input tri0 id_6,
    output uwire id_7,
    output wor id_8,
    input wor id_9,
    output uwire id_10
);
  wire id_12;
  wire id_13;
  wire id_14;
endmodule
module module_1 (
    input uwire id_0,
    output tri id_1,
    output supply0 id_2,
    output supply0 id_3,
    inout supply1 id_4,
    output tri id_5,
    input uwire id_6,
    input tri1 id_7,
    output supply1 id_8,
    input tri0 id_9,
    input wand id_10,
    input tri id_11
);
  assign id_1 = 1;
  nand primCall (id_2, id_10, id_11, id_7, id_4, id_6);
  module_0 modCall_1 (
      id_10,
      id_4,
      id_9,
      id_11,
      id_6,
      id_5,
      id_4,
      id_3,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_9 = 0;
endmodule
