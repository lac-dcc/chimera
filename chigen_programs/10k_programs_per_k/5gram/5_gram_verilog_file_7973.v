// Seed: 3715902510
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri0 id_4
);
  initial $signed(74);
  ;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input wor id_2,
    input tri id_3,
    input wire id_4,
    input supply1 id_5,
    output tri id_6,
    input tri0 id_7,
    input uwire id_8,
    output wor id_9,
    input supply0 id_10,
    output tri0 id_11
);
  wire \id_13 ;
  assign \id_13 = id_0;
  module_0 modCall_1 (
      id_10,
      id_5,
      id_8,
      id_5,
      id_10
  );
  assign modCall_1.id_3 = 0;
endmodule
