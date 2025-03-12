// Seed: 590689789
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    output supply0 id_2,
    output supply0 id_3,
    output uwire id_4,
    output tri id_5,
    output wor id_6
);
  wire id_8;
  assign id_2 = 1 ? id_0 : -1;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    output tri0 id_3,
    output wire id_4,
    output wire id_5,
    output wor id_6
);
  assign id_6 = id_1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_6,
      id_3,
      id_5,
      id_3,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
