// Seed: 2765915165
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    output tri0 id_2,
    input wor id_3,
    output tri0 id_4,
    output tri id_5
);
  wire id_7;
  module_2 modCall_1 (
      id_7,
      id_7
  );
  assign modCall_1.type_11 = 0;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input wor id_0,
    input wand id_1,
    input supply1 id_2,
    input supply0 id_3,
    output uwire id_4,
    output supply0 id_5,
    input tri id_6,
    input supply1 id_7
);
  nand primCall (id_4, id_6, id_1, id_3, id_7, id_2, id_0);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_4,
      id_4
  );
endmodule
module module_2 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
  wire id_4;
  assign id_2 = 1'b0;
  tri0 id_5;
  supply0 id_6;
  assign id_2 = id_5 == 1;
  wire id_7;
  always id_4 = ~id_6;
endmodule
