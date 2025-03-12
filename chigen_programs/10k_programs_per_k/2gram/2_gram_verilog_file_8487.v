// Seed: 3563436192
module module_0 (
    input uwire id_0,
    output wand id_1,
    input supply1 id_2,
    output tri1 id_3,
    input tri0 id_4,
    output supply1 id_5,
    input wor id_6,
    output tri id_7,
    output tri1 id_8,
    input wire id_9
);
endmodule
module module_1 (
    output supply1 id_0,
    input uwire id_1,
    input wand id_2,
    input tri1 id_3
);
  wire id_5 = id_3;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_0,
      id_3,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input supply0 id_0,
    output tri id_1,
    input tri id_2,
    input uwire id_3,
    input tri id_4,
    input tri1 id_5,
    output uwire id_6,
    output tri1 id_7,
    output tri0 id_8
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_8,
      id_5,
      id_8,
      id_5,
      id_1,
      id_7,
      id_2
  );
endmodule
