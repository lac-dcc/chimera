// Seed: 4058279417
module module_0 (
    input supply1 id_0,
    output uwire id_1,
    input wire id_2,
    output tri id_3,
    input wire id_4,
    output supply0 id_5,
    input uwire id_6,
    input tri id_7,
    input uwire id_8,
    input tri0 id_9,
    input tri0 id_10,
    output tri id_11,
    output tri0 id_12,
    input wor id_13,
    input wand id_14
);
endmodule
module module_1 (
    input wire id_0,
    output supply1 id_1
);
  assign id_1 = id_0 ? id_0 : -1;
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
