// Seed: 1605195243
module module_0 (
    input supply0 id_0,
    input tri id_1
);
endmodule
module module_1 (
    input tri1 id_0,
    output tri0 id_1,
    output wor id_2,
    output supply0 id_3,
    output wire id_4,
    output supply0 id_5,
    output tri1 id_6,
    input wand id_7,
    output supply1 id_8,
    output tri0 id_9,
    output tri1 id_10,
    input wor id_11,
    output supply1 id_12
);
  wire id_14;
  id_15(
      .id_0(id_0),
      .id_1(1'b0),
      .id_2(1'd0),
      .id_3(id_0),
      .id_4((id_12)),
      .id_5('d0),
      .id_6(id_12),
      .id_7(1'b0),
      .id_8(id_5),
      .id_9(1),
      .id_10(id_9)
  );
  module_0 modCall_1 (
      id_0,
      id_11
  );
  assign modCall_1.id_0 = 0;
  genvar id_16;
  wire id_17;
  wor id_18, id_19;
  assign id_4 = id_14;
  nand primCall (id_6, id_15, id_0, id_7, id_14);
  wire id_20 = id_4++;
  assign (strong1, supply0) id_18 = 1;
  wire id_21;
  wire id_22;
endmodule
