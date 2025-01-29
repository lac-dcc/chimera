// Seed: 2143879255
module module_0 (
    output wor id_0,
    output wor id_1,
    input wand id_2,
    output uwire id_3,
    output supply1 id_4,
    input tri1 id_5,
    input wor id_6,
    input tri0 id_7
);
  uwire id_9, id_10 = id_2;
  assign module_1.type_13 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input supply0 id_1,
    input wor id_2,
    input uwire id_3
);
  specify
    (id_5 => id_6) = (-1 * id_6, id_6, 1, (1), id_2 + id_6);
    (id_7 => id_8) = (1, id_7 - 1);
    (id_9 => id_10) = ("" ^ 1  : id_5  : id_1);
    (id_11 => id_12) = (id_8);
  endspecify
  assign id_6 = 1;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5,
      id_7
  );
  assign id_7 = -1'b0;
  assign id_8 = 1'b0;
endmodule
