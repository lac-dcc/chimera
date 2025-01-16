// Seed: 368948359
module module_0 (
    output supply1 id_0,
    output supply0 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input tri1 id_4
);
  assign id_1 = id_4;
  wire id_6;
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    output wire id_2,
    input wand id_3,
    output uwire id_4,
    output wand id_5,
    output tri1 id_6,
    output wor id_7,
    output logic id_8
);
  uwire id_10;
  tri   id_11;
  always
    if ((-1)) id_10 = -1;
    else begin : LABEL_0
      id_8 <= -1 && id_0;
    end
  assign id_2 = ((id_11)) != "";
  id_12(
      .id_0(1'd0),
      .id_1(id_0),
      .id_2(1),
      .id_3(id_10),
      .id_4(""),
      .id_5(1),
      .id_6(-1'd0),
      .id_7(-1'b0 % id_11.id_6),
      .id_8(id_10),
      .id_9(id_7),
      .id_10(1),
      .id_11(-1),
      .id_12(-1),
      .id_13(1),
      .sum(id_2),
      .id_14(1),
      .id_15(id_5(1)),
      .id_16(id_6 + -1),
      .id_17(-1),
      .id_18(id_0),
      .id_19(id_1),
      .id_20(1),
      .id_21(id_8 & id_8),
      .id_22(id_8),
      .id_23(-1),
      .id_24(-1),
      .id_25(id_1),
      .id_26(1),
      .id_27(id_5 != id_6 || -1 != id_3),
      .id_28({1, id_1})
  );
  module_0 modCall_1 (
      id_4,
      id_2,
      id_3,
      id_0,
      id_0
  );
endmodule
