// Seed: 3429124868
module module_0 (
    output supply1 id_0,
    output wand id_1,
    input uwire id_2,
    input wire id_3,
    output tri id_4,
    output tri0 id_5,
    input tri id_6,
    input wor id_7,
    output tri0 id_8,
    input supply0 id_9,
    input uwire id_10,
    input wire id_11,
    output tri id_12,
    input uwire id_13,
    input wire id_14,
    output wor id_15,
    output uwire id_16,
    input wor id_17
);
  wire id_19;
endmodule
module module_1 (
    input wand id_0,
    input tri  id_1
);
  if (id_1)
    id_3(
        .id_0(1 - 1),
        .id_1(id_0 & 1),
        .id_2(1),
        .id_3(~id_0),
        .id_4(id_0),
        .id_5(1),
        .id_6(id_1),
        .id_7(),
        .id_8()
    );
  else begin : LABEL_0
    always disable id_4;
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_1,
      id_4,
      id_0,
      id_1,
      id_1,
      id_4,
      id_4,
      id_0,
      id_4,
      id_4,
      id_0
  );
endmodule
