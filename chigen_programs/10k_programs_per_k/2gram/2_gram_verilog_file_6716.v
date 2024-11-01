// Seed: 761898212
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input uwire id_2,
    input tri0 id_3,
    input tri1 id_4,
    input tri0 id_5,
    input uwire id_6,
    output wire id_7,
    output wire id_8,
    output wor id_9,
    input tri0 id_10,
    output uwire id_11,
    input uwire id_12,
    input uwire id_13,
    input tri1 id_14,
    input wor id_15,
    input supply0 id_16,
    input wand id_17,
    output tri0 id_18,
    input wor id_19,
    output tri0 id_20,
    input uwire id_21,
    input tri id_22
);
  wire id_24;
  assign id_0 = id_5;
  logic [7:0] id_25;
  id_26(
      .id_0(id_0),
      .id_1(id_25[~1'b0]),
      .id_2(1),
      .id_3(id_21),
      .id_4(1 & 1),
      .id_5(id_14),
      .id_6(id_19),
      .id_7(id_2),
      .id_8(id_4 != ~id_3),
      .id_9(1),
      .id_10(~id_4),
      .id_11(1),
      .id_12(1),
      .id_13(~1'h0 & 1),
      .id_14(id_3),
      .id_15(1),
      .id_16(1),
      .id_17(id_15)
  );
  wire id_27;
  wire id_28, id_29;
endmodule
module module_1 (
    output uwire id_0,
    input  wor   id_1,
    input  uwire id_2,
    output wor   id_3
);
  wire id_5;
  module_0(
      id_3,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_0,
      id_3,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_0,
      id_1,
      id_0,
      id_1,
      id_2
  );
endmodule
