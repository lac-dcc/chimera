// Seed: 3364125502
module module_0 (
    output tri0 id_0
    , id_3, id_4,
    input  tri1 id_1
);
  wire id_5;
  specify
    (id_6 => id_7) = (id_7 | 1  : {1, 1} : id_1);
    (id_8 => id_9) = 1;
  endspecify
  assign module_2.type_1 = 0;
endmodule
module module_1 (
    input  wand id_0,
    input  tri0 id_1,
    output tri0 id_2
);
  tri id_4 = 1;
  assign id_2 = 1'b0;
  module_0 modCall_1 (
      id_2,
      id_0
  );
  assign modCall_1.id_9 = 0;
  wire id_5 = id_4 + 1;
endmodule
module module_2 (
    input uwire id_0,
    output wand id_1,
    input supply1 id_2,
    output supply0 id_3
);
  assign id_1 = id_0;
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_2
  );
endmodule
