// Seed: 951668978
module module_0 (
    input tri id_0,
    input tri id_1,
    output supply1 id_2,
    id_24,
    input supply0 id_3,
    input uwire id_4,
    input uwire id_5,
    input uwire id_6,
    input wor id_7,
    output wire id_8,
    input wire id_9,
    input tri1 id_10,
    input supply1 id_11,
    output tri1 id_12,
    input tri id_13,
    input wand id_14,
    output supply0 id_15,
    input wand id_16,
    output wor id_17,
    input wor id_18,
    input uwire id_19,
    output uwire id_20,
    input tri id_21,
    output wand id_22
);
  wire id_25, id_26;
  assign id_2 = id_16;
endmodule
module module_1 (
    output tri id_0,
    id_4,
    input supply1 id_1,
    output uwire id_2
);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_6 = 0;
  assign id_0 = id_1;
  id_5(
      .id_0(1), .id_1(1), .id_2(), .id_3(1), .id_4(), .id_5(-1), .id_6((id_1))
  );
endmodule
