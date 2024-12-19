// Seed: 1372554345
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    output supply0 id_2,
    output wor id_3,
    input uwire id_4,
    output wor id_5,
    output wor id_6,
    output uwire id_7,
    input wire id_8,
    input uwire id_9,
    input tri id_10,
    output supply1 id_11,
    input tri id_12,
    output tri0 id_13,
    input tri id_14
    , id_18,
    input tri1 id_15,
    output supply0 id_16
);
  id_19(
      .id_0(1), .id_1(1)
  );
  tri1 id_20;
  assign id_13 = 1 ? id_9 & id_20 : id_15;
  assign id_16 = 1'd0 == id_0;
endmodule
module module_1 (
    output supply1 id_0,
    input wire id_1,
    input tri id_2,
    input supply0 id_3,
    output supply1 id_4,
    input supply1 id_5
);
  wire id_7;
  not primCall (id_0, id_5);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_0,
      id_5,
      id_0,
      id_4,
      id_0,
      id_2,
      id_5,
      id_3,
      id_4,
      id_2,
      id_0,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
