// Seed: 433487361
module module_0 (
    input supply1 id_0,
    output wand id_1,
    input wor id_2,
    output wor id_3,
    output supply1 id_4,
    output tri0 id_5,
    output wor id_6,
    output tri0 id_7
);
  assign id_1 = id_2;
  module_2 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_1
  );
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    input wor id_2,
    output uwire id_3
);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  wire id_5;
  wire id_6;
  wire id_7;
endmodule
module module_2 (
    input  tri0 id_0,
    input  wire id_1,
    output tri1 id_2,
    output wire id_3
);
  assign id_2 = id_1 ? 1'b0 : id_0 - 1;
  assign id_2 = 1;
  always disable id_5;
endmodule
