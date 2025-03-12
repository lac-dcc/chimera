// Seed: 2496683770
module module_0 (
    input wor id_0,
    output uwire id_1,
    output uwire id_2,
    input uwire id_3,
    input supply0 id_4,
    input wor id_5,
    input tri id_6,
    input tri id_7,
    input uwire id_8,
    input uwire id_9,
    input tri id_10,
    input wand id_11,
    input wire id_12,
    output wor id_13
);
  assign id_1 = -1;
  assign id_2 = 1;
endmodule
module module_1 (
    output wor id_0,
    input wire id_1,
    input tri0 id_2,
    input wand id_3,
    input tri0 id_4,
    output wand id_5,
    output supply0 id_6
);
  wire id_8;
  always disable id_9;
  assign id_5 = {1{id_1}};
  module_0 modCall_1 (
      id_3,
      id_5,
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_2,
      id_4,
      id_4,
      id_2,
      id_6
  );
  assign modCall_1.id_6 = 0;
  assign id_0 = 1;
endmodule
