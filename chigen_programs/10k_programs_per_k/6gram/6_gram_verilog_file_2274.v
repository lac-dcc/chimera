// Seed: 174388303
module module_0 (
    output tri0 id_0,
    output wor  id_1,
    output tri1 id_2
);
  assign id_2 = 1;
  assign id_1 = id_4;
endmodule
module module_1 (
    output tri id_0,
    input supply0 id_1,
    input uwire id_2,
    output supply1 id_3,
    output wire id_4,
    output wire id_5,
    input tri1 id_6,
    input supply1 id_7,
    input tri id_8,
    output uwire id_9,
    output uwire id_10,
    input wor id_11,
    input wor id_12,
    input uwire id_13,
    output uwire id_14
);
  wire id_16;
  nor (id_14, id_2, id_11, id_8, id_1, id_16, id_13, id_12, id_6, id_7);
  module_0(
      id_9, id_10, id_14
  );
endmodule
