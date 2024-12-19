// Seed: 2144540418
module module_0 (
    output supply1 id_0,
    output tri id_1,
    output tri1 id_2,
    input tri0 id_3,
    input wand id_4,
    input wire id_5,
    input wor id_6,
    input tri id_7,
    input wor id_8,
    output supply1 id_9
    , id_17,
    input wand id_10,
    input wor id_11,
    input wor id_12,
    input uwire id_13,
    output supply1 id_14,
    input tri id_15
);
  assign id_1 = id_7;
  wire id_18;
  assign id_1 = 1;
  wire id_19 = id_15;
  assign module_1.id_7 = 0;
  tri0 id_20 = 1;
endmodule
module module_1 (
    output wand id_0,
    input uwire id_1,
    input uwire id_2,
    output logic id_3,
    input wand id_4,
    input tri id_5,
    output tri1 id_6,
    output wand id_7,
    output supply1 id_8,
    input tri0 id_9,
    input tri1 id_10,
    input wor id_11,
    input wor id_12,
    input wire id_13,
    input tri0 id_14,
    input tri1 id_15,
    input tri0 id_16,
    output supply1 id_17,
    input tri id_18
);
  initial begin : LABEL_0
    id_3 <= #1 id_16 - 1;
  end
  module_0 modCall_1 (
      id_0,
      id_6,
      id_6,
      id_5,
      id_1,
      id_2,
      id_4,
      id_9,
      id_2,
      id_8,
      id_14,
      id_15,
      id_13,
      id_10,
      id_6,
      id_10
  );
  id_20(
      .id_0((1'b0)),
      .id_1(1),
      .id_2(id_7),
      .id_3(1 & id_13 - 1),
      .id_4(id_17),
      .id_5(id_14),
      .id_6(~id_3),
      .id_7(1),
      .id_8(),
      .id_9(id_4 == id_15),
      .id_10((1))
  );
endmodule
