// Seed: 1992466455
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input tri id_2,
    input supply1 id_3,
    input uwire id_4,
    input tri1 id_5,
    input supply1 id_6,
    input tri1 id_7,
    output supply0 id_8,
    input tri0 id_9
);
  always_comb id_8 = 1;
  module_2 modCall_1 (id_8);
endmodule
module module_1 (
    input wor id_0,
    inout supply1 id_1,
    output tri id_2,
    input wire id_3,
    inout wire id_4
);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_1,
      id_0,
      id_4,
      id_1,
      id_4
  );
  assign modCall_1.type_12 = 0;
endmodule
module module_2 (
    output wire id_0
);
  assign module_0.id_8 = 0;
endmodule
