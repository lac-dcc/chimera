// Seed: 2975675360
module module_0 (
    output uwire id_0,
    input wor id_1,
    input wor id_2,
    input tri0 id_3,
    input supply0 id_4,
    input tri1 id_5,
    input supply1 id_6,
    input uwire id_7,
    output tri1 id_8,
    output tri1 id_9,
    input wand id_10,
    input uwire id_11,
    input supply0 id_12,
    output tri1 id_13
);
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    input tri1 id_2,
    input supply1 id_3
);
  wor id_5, id_6;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_5,
      id_5,
      id_6,
      id_6,
      id_6,
      id_1,
      id_1,
      id_6
  );
  assign id_6 = id_5;
  assign id_6 = {1{id_0}};
endmodule
