// Seed: 2965210276
module module_0 (
    output tri id_0,
    output supply0 id_1,
    input uwire id_2,
    input supply1 id_3,
    input wire id_4,
    output wire module_0,
    input tri1 id_6,
    input supply1 id_7,
    output tri id_8,
    input uwire id_9
    , id_14,
    input uwire id_10,
    input wor id_11,
    output wor id_12
);
  wire [-1 : 1 'b0 <=  -1] id_15;
endmodule
module module_1 (
    output wire id_0,
    input tri1 id_1,
    input wor id_2,
    output supply0 id_3
);
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_1,
      id_2,
      id_2,
      id_3,
      id_2,
      id_1,
      id_3,
      id_2,
      id_1,
      id_1,
      id_3
  );
  assign modCall_1.id_1 = 0;
  assign id_3 = id_2;
endmodule
