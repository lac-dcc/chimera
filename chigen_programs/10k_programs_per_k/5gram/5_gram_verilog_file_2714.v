// Seed: 2210579557
module module_0 (
    output tri id_0,
    output uwire id_1,
    input supply0 id_2,
    output tri1 id_3
);
endmodule
module module_1 (
    output wor id_0,
    input wand id_1,
    input supply1 id_2,
    input supply0 id_3,
    input uwire id_4,
    output supply0 id_5
);
  assign id_5 = -1;
  nor primCall (id_5, id_4, id_2);
  module_0 modCall_1 (
      id_5,
      id_0,
      id_2,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    output wor id_0,
    input uwire id_1,
    input wire id_2,
    output wire id_3,
    output wand id_4,
    output uwire id_5,
    output wire id_6,
    input supply0 id_7,
    output tri1 id_8,
    input tri1 id_9,
    output tri1 id_10,
    input tri id_11,
    output tri0 id_12
);
  supply0 id_14 = -1;
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_11,
      id_4
  );
endmodule
