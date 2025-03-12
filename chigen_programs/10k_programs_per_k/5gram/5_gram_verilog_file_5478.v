// Seed: 2472361092
module module_0 (
    output wor id_0,
    output tri id_1,
    input tri id_2,
    input supply0 id_3,
    input supply1 id_4,
    output tri1 id_5,
    input tri1 id_6,
    output tri1 id_7,
    input tri0 id_8
);
  assign id_0 = -1;
  module_2 modCall_1 (
      id_0,
      id_8,
      id_4,
      id_8,
      id_3,
      id_5,
      id_5
  );
endmodule
module module_1 (
    input tri0 id_0,
    output tri1 id_1,
    input wand id_2,
    input tri1 id_3,
    output supply1 id_4,
    input wor id_5,
    input wand id_6
);
  module_0 modCall_1 (
      id_4,
      id_1,
      id_6,
      id_2,
      id_5,
      id_1,
      id_5,
      id_1,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
module module_2 (
    output tri1 id_0,
    input uwire id_1,
    input wor id_2,
    input wire id_3,
    input supply0 id_4,
    output supply0 id_5,
    output supply1 id_6
);
  assign module_0.id_8 = 0;
  logic id_8;
endmodule
