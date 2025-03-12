// Seed: 1623377366
module module_0 (
    output tri id_0,
    input tri1 id_1,
    output uwire id_2,
    input wor id_3,
    output supply1 id_4,
    input uwire id_5,
    input uwire id_6,
    output tri0 id_7,
    output supply0 id_8,
    input supply1 id_9
);
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    input wor id_2,
    output tri1 id_3,
    input wire id_4,
    output supply0 id_5,
    output supply0 id_6
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_2,
      id_5,
      id_0,
      id_1,
      id_5,
      id_5,
      id_4
  );
endmodule
