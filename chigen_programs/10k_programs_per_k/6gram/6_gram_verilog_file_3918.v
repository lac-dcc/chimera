// Seed: 1882805104
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    input supply0 id_2
    , id_4
);
  tri0 id_5;
  wire id_6;
  assign id_5 = (id_0);
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    output uwire id_2,
    input tri id_3,
    output supply0 id_4
);
  assign id_4 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3
  );
  assign modCall_1.type_7 = 0;
  assign #1 id_2 = 1'b0;
  assign id_4 = id_0;
  wire id_6, id_7, id_8;
  tri1 id_9 = id_3, id_10;
endmodule
