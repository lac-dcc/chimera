// Seed: 2915471503
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wor id_3
);
  wire id_5;
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    input wor id_2,
    input wire id_3,
    input wor id_4,
    output wor id_5,
    output supply0 id_6,
    output wor id_7
);
  specify
    (id_9 => id_10) = (1  : id_4  : id_10, id_0  : id_3  : 1);
    $setup(id_11, negedge id_12, id_3);
    (id_13 => id_14) = (id_3, 1  : id_0  : id_10);
  endspecify
  module_0 modCall_1 (
      id_7,
      id_10,
      id_12,
      id_9
  );
  assign modCall_1.id_1 = 0;
endmodule
