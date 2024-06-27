module module_0 (
    input logic id_1,
    input id_2,
    input [1 'b0 : id_1] id_3,
    output logic id_4,
    input id_5,
    input id_6,
    input logic id_7,
    input id_8
);
  id_9 id_10 (
      .id_2(1),
      .id_2(id_4)
  );
  id_11 id_12 (
      .id_5 (id_4[id_8]),
      .id_1 (1),
      .id_10(id_8),
      .id_3 (id_1),
      .id_7 (1),
      .id_4 (id_4),
      .id_8 (id_4),
      .id_10(id_2),
      .id_3 (id_1),
      .id_8 (id_8),
      .id_7 (id_3)
  );
  logic id_13 (
      .id_1(id_1),
      .id_4(id_1)
  );
  id_14 id_15 (
      .id_6 (id_7),
      .id_10(1)
  );
  id_16 id_17 (
      .id_3 (id_8),
      .id_4 (id_2),
      .id_15(id_2),
      .id_12(id_15)
  );
  logic id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25;
  assign id_1[1] = 1;
  id_26 id_27 (
      .id_1 (id_22),
      .id_2 (id_19[id_20]),
      .id_3 (~id_20[id_10]),
      .id_24(id_4)
  );
  id_28 id_29 (
      .id_10(id_7),
      .id_24(id_5),
      .id_24(id_20),
      .id_6 (id_25)
  );
  id_30 id_31 (
      .id_10(id_20),
      .id_7 (id_2),
      .id_19(id_29),
      .id_7 (id_15),
      .id_10(id_22),
      .id_19(id_12),
      .id_10(id_27)
  );
  logic id_32;
  id_33 id_34 (
      .id_20(id_23),
      .id_15(1'b0 && id_13 && 1 && id_20),
      .id_18(id_31),
      .id_15(id_12),
      .id_23(id_17),
      .id_4 (id_17),
      .id_20(id_6)
  );
  id_35 id_36 (
      .id_12(id_10),
      .id_21(id_8),
      .id_13(id_22),
      .id_6 (id_20),
      .id_34(id_7),
      .id_8 (1)
  );
  id_37 id_38 (
      .id_17(id_29),
      .id_7 (id_27),
      .id_13(id_8)
  );
  id_39 id_40 (
      .id_25(id_29),
      .id_2 (id_23),
      .id_1 (id_10)
  );
  id_41 id_42 (
      .id_1 (id_34),
      .id_1 (1'b0),
      .id_24(id_25)
  );
  id_43 id_44 (
      .id_6 (id_1),
      .id_3 (id_19),
      .id_20(id_10)
  );
  id_45 id_46 (
      .id_21(id_10),
      .id_29(id_44)
  );
  assign id_6 = id_36;
  id_47 id_48 (
      .id_29(id_23),
      .id_27(id_4),
      .id_29(id_6),
      .id_20(id_17)
  );
  id_49 id_50 (
      .id_32(id_17),
      .id_42(id_38)
  );
  id_51 id_52 (
      .id_46(id_32),
      .id_32(id_34)
  );
  id_53 id_54 (
      .id_15(id_32),
      .id_27(id_52),
      .id_50(id_25),
      .id_29(id_32),
      .id_32(id_24)
  );
  assign id_38[id_4] = id_52;
  assign id_27 = id_52;
endmodule
