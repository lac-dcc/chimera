// Seed: 2454415052
module module_0 (
    output supply0 id_0,
    input uwire id_1,
    input tri id_2,
    input supply1 id_3,
    output tri id_4,
    input supply1 id_5,
    input uwire id_6
);
  assign id_4 = 1;
  assign id_0 = 1;
endmodule
module module_1 (
    input  tri0  id_0,
    input  uwire id_1,
    output tri   id_2
);
  supply1 id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_4,
      id_2,
      id_4,
      id_1
  );
  assign modCall_1.type_1 = 0;
  tri0 id_5 = 1;
  tri1 id_6 = 1;
  assign id_2 = id_4 ? id_6 : 1'b0;
  supply0 id_7 = id_4.id_0, id_8;
endmodule
