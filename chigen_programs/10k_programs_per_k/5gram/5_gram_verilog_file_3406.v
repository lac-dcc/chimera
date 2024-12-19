// Seed: 1407933463
module module_0 (
    output wor id_0,
    input supply1 id_1,
    input tri1 id_2,
    input wor id_3,
    output wor id_4,
    input supply0 id_5,
    input supply0 id_6,
    output tri1 id_7,
    input tri1 id_8,
    output tri id_9,
    output wor id_10
);
  id_12(
      .id_0(id_8), .id_1(id_4 && 1'b0), .id_2(id_5)
  );
  wire id_13;
  assign id_0 = id_8;
endmodule
module module_1 (
    output supply0 id_0,
    input  uwire   id_1
);
  supply1 id_3 = id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_10 = 0;
endmodule
