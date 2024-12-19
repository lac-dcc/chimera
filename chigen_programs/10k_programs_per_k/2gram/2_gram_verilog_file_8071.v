// Seed: 1524425315
module module_0 (
    output tri0 id_0,
    output uwire id_1,
    output wor id_2,
    input supply1 id_3,
    input wire id_4
);
  id_6(
      .id_0(id_0),
      .id_1(1),
      .id_2(1),
      .id_3(),
      .id_4(id_1),
      .id_5(id_1),
      .id_6(id_2),
      .id_7(1),
      .id_8(id_1)
  );
  wire id_7;
  assign id_7 = ~1;
endmodule
module module_1 (
    input wor id_0,
    input tri id_1,
    input uwire id_2,
    input tri0 id_3,
    input wor id_4,
    input tri1 id_5,
    output supply1 id_6,
    output wor id_7,
    output uwire id_8,
    input wire id_9,
    output tri id_10,
    output tri id_11,
    input wand id_12,
    output wire id_13,
    input tri1 id_14,
    output tri0 id_15,
    output wire id_16,
    input uwire id_17,
    input wor id_18,
    input wor id_19,
    input wand id_20,
    output supply1 id_21,
    input wor id_22,
    input supply1 id_23
);
  tri0 id_25, id_26, id_27, id_28;
  module_0 modCall_1 (
      id_8,
      id_13,
      id_16,
      id_1,
      id_9
  );
  assign modCall_1.id_0 = 0;
  assign id_21 = 1 - 1;
  id_29(
      id_1, 1
  );
  initial begin : LABEL_0
    id_27 = 1'b0 && 1;
    @(1 or id_12);
    id_6 = 1 ^ id_9;
    $display;
  end
  genvar id_30;
endmodule
