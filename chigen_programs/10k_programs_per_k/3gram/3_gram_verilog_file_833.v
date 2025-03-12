// Seed: 808142136
module module_0 (
    output uwire id_0,
    input uwire id_1,
    input supply0 id_2,
    input tri id_3,
    input supply1 id_4,
    input tri id_5,
    output wire id_6,
    output uwire id_7,
    input wor id_8,
    input wor id_9,
    output uwire id_10,
    input uwire id_11,
    output tri id_12,
    input wand id_13
);
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    output tri0 id_2,
    output tri0 id_3,
    output tri1 id_4,
    output tri0 id_5,
    output tri id_6
);
  not primCall (id_6, id_1);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_5,
      id_4,
      id_0,
      id_1,
      id_3,
      id_1,
      id_6,
      id_0
  );
  assign modCall_1.id_12 = 0;
endmodule
