// Seed: 3947805236
module module_0 (
    input uwire id_0,
    output wire id_1,
    output supply1 id_2,
    input uwire id_3
);
  wire id_5;
  assign module_2.type_15 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output tri0 id_2,
    input tri id_3,
    input wor id_4,
    input supply0 id_5,
    input tri0 id_6,
    output tri0 id_7,
    input wor id_8,
    input tri1 id_9,
    output supply0 id_10,
    output tri0 id_11
);
  module_0 modCall_1 (
      id_5,
      id_10,
      id_2,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    output tri1 id_0,
    input tri id_1,
    output wor id_2,
    input uwire id_3,
    output supply1 id_4,
    input tri1 id_5,
    input tri1 id_6,
    input uwire id_7
);
  wire id_9;
  wor id_10, id_11;
  wire id_12;
  assign id_10 = 1;
  tri1 id_13 = id_10;
  nor primCall (id_4, id_6, id_3, id_12, id_11, id_1, id_5, id_7, id_10, id_13, id_9);
  module_0 modCall_1 (
      id_7,
      id_4,
      id_4,
      id_6
  );
  uwire id_14 = 1'b0;
endmodule
