// Seed: 2379973590
module module_0 (
    output tri0 id_0,
    input tri id_1,
    output wand id_2,
    output wor id_3,
    input tri1 id_4,
    input tri id_5,
    output uwire id_6,
    output supply0 id_7,
    input uwire id_8,
    output supply1 id_9,
    input tri1 id_10,
    input tri id_11,
    input wire id_12,
    input supply1 id_13
);
  wire id_15;
endmodule
module module_1 (
    input supply0 id_0,
    output wor id_1,
    input wire id_2
);
  not primCall (id_1, id_0);
  supply1 id_4 = 1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1,
      id_2,
      id_1,
      id_0,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
