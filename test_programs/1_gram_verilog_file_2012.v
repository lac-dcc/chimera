// Seed: 3209970187
module module_0 (
    input uwire id_0,
    input wand id_1,
    output wand id_2,
    input tri0 id_3,
    input wire id_4,
    input wor id_5,
    input wor id_6,
    id_16,
    input tri0 id_7,
    output supply1 id_8,
    input wand id_9,
    input wand id_10,
    output supply0 id_11,
    id_17,
    input tri1 id_12,
    input wire id_13,
    input tri id_14
);
  wire id_18;
  wire id_19;
  wire id_20;
  id_21(
      1 + 1, id_16
  ); id_22(
      ~id_5
  );
endmodule
module module_1 (
    input  wor  id_0,
    output wor  id_1,
    output wire id_2
);
  id_4(
      .id_0(id_2),
      .id_1(id_1),
      .id_2(-1),
      .id_3(1),
      .id_4(1'b0),
      .id_5(id_1),
      .id_6(id_5),
      .id_7(id_5),
      .id_8(id_2 - 1)
  );
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_9 = 0;
endmodule
