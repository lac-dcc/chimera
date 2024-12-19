// Seed: 326023302
module module_0 (
    output supply0 id_0,
    input wand id_1,
    output wire id_2,
    input supply1 id_3,
    input uwire id_4,
    input wand id_5,
    input wor id_6,
    output tri0 id_7,
    input supply0 id_8,
    input tri1 id_9,
    input uwire id_10
);
  wire id_12;
endmodule
module module_1 (
    output tri0 id_0,
    input  tri1 id_1,
    input  wor  id_2,
    input  wire id_3,
    input  tri0 id_4,
    input  wire id_5
);
  wire id_7;
  assign id_0 = 1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_0,
      id_2,
      id_5,
      id_3,
      id_1,
      id_0,
      id_2,
      id_5,
      id_3
  );
  assign modCall_1.type_14 = 0;
  wire id_8;
  or primCall (id_0, id_2, id_1, id_7, id_4, id_5);
endmodule
