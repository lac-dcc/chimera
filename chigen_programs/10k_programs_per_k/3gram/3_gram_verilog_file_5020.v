// Seed: 1336949539
module module_0 (
    input wor id_0,
    input wand id_1,
    input supply0 id_2,
    input supply1 id_3,
    input supply1 id_4,
    output supply0 id_5,
    input wire id_6,
    output wand id_7,
    input tri id_8,
    input uwire id_9,
    output uwire id_10,
    input wor id_11,
    input wor id_12,
    output uwire id_13,
    input uwire id_14,
    input uwire id_15,
    input supply1 id_16,
    output tri id_17,
    input wor id_18,
    input tri1 id_19,
    output tri id_20
);
  id_22(
      .id_0(id_11), .id_1(id_2), .id_2(1), .id_3(1), .id_4(1)
  );
endmodule
module module_1 (
    input wand id_0,
    output tri0 id_1,
    input wand id_2,
    output uwire id_3,
    input tri0 id_4,
    input tri id_5,
    input wor id_6,
    input supply1 id_7
    , id_14,
    inout wire id_8,
    input wor id_9,
    input tri0 id_10,
    output supply1 id_11,
    input tri1 id_12
);
  initial begin : LABEL_0
    id_14 = {id_9 & 1'b0 & id_7{id_6}};
  end
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_9,
      id_5,
      id_8,
      id_6,
      id_14,
      id_4,
      id_2,
      id_14,
      id_2,
      id_4,
      id_14,
      id_0,
      id_4,
      id_6,
      id_3,
      id_14,
      id_4,
      id_14
  );
  assign modCall_1.id_3 = 0;
endmodule
