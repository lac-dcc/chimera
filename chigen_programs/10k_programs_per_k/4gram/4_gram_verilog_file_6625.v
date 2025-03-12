// Seed: 2922869773
module module_0 (
    output wor id_0,
    input supply1 id_1,
    input wand id_2,
    output supply1 id_3,
    input tri0 id_4
);
endmodule
module module_1 (
    input tri0 id_0,
    output tri1 id_1,
    input wor id_2,
    input supply1 id_3,
    input wand id_4
);
  assign id_1 = (1) && ~id_4;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_4,
      id_1,
      id_3
  );
endmodule
module module_2 (
    input tri0 id_0,
    output wand id_1,
    input tri0 id_2,
    output supply1 id_3,
    input tri1 id_4,
    input uwire id_5,
    output wire id_6,
    input supply1 id_7,
    input supply0 id_8,
    input tri0 id_9,
    input wire id_10,
    input uwire id_11,
    output wor id_12
);
  wire id_14;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_5,
      id_12,
      id_5
  );
  assign modCall_1.id_3 = 0;
endmodule
