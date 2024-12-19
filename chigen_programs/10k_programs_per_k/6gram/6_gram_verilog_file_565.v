// Seed: 1954731545
module module_0 (
    output wire id_0,
    input supply0 id_1,
    input wor id_2,
    input supply0 id_3,
    output uwire id_4
    , id_27,
    input tri1 id_5,
    output wire id_6,
    input supply0 id_7,
    input tri0 id_8,
    input tri id_9,
    input uwire id_10,
    output supply1 id_11,
    output supply1 id_12,
    input wand id_13,
    output supply0 id_14,
    input tri id_15,
    input tri id_16,
    input wor id_17,
    input wand id_18,
    input supply1 id_19,
    input tri1 id_20,
    input supply1 id_21,
    output tri id_22,
    input uwire id_23,
    output wor id_24,
    output wire id_25
);
  assign id_24 = id_2;
  assign id_27 = 1;
  assign id_11 = id_18;
  assign module_1.id_1 = 0;
  wand id_28 = id_8;
  id_29(
      .id_0(1),
      .id_1(1),
      .id_2(id_28),
      .id_3(1),
      .id_4(id_23),
      .id_5(id_19),
      .id_6(1),
      .id_7(1),
      .id_8(1'h0),
      .id_9(id_17),
      .id_10(id_7),
      .id_11(1),
      .id_12(id_16)
  );
endmodule
module module_1 (
    input  uwire id_0,
    output tri1  id_1,
    input  wire  id_2,
    input  logic id_3,
    output tri1  id_4
);
  wire  id_6;
  logic id_7 = id_3;
  always @(*) id_7 = #1 1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_1,
      id_0,
      id_2,
      id_2,
      id_0,
      id_4,
      id_4,
      id_0,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_4,
      id_2,
      id_1,
      id_1
  );
endmodule
