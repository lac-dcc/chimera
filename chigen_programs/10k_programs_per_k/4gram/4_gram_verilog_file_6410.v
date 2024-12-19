// Seed: 935773682
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input supply0 id_2,
    output supply1 id_3,
    input wire id_4,
    input uwire id_5
);
  wire id_7;
  assign id_3 = id_1 ? 1 : 1'b0 - 1;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1
    , id_10,
    input wor id_2,
    input tri0 id_3,
    input wand id_4,
    output uwire id_5
    , id_11,
    output supply1 id_6,
    input tri id_7,
    output tri0 id_8
);
  wire id_12;
  nor primCall (id_6, id_3, id_12, id_10, id_7, id_2, id_1, id_0);
  module_0 modCall_1 (
      id_4,
      id_3,
      id_7,
      id_5,
      id_1,
      id_4
  );
  assign modCall_1.type_1 = 0;
endmodule
