// Seed: 230621954
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    input uwire id_2,
    output tri id_3,
    output uwire id_4,
    input wire id_5,
    output wor id_6,
    output uwire id_7,
    input wire id_8
);
  wire [-1 : 1] id_10;
endmodule
module module_1 (
    output uwire id_0,
    output supply0 id_1,
    input tri id_2,
    output wor id_3,
    input supply1 id_4,
    output wor id_5
);
  module_0 modCall_1 (
      id_3,
      id_4,
      id_2,
      id_1,
      id_0,
      id_2,
      id_3,
      id_5,
      id_2
  );
  assign modCall_1.id_3 = 0;
  assign id_1 = -1;
endmodule
