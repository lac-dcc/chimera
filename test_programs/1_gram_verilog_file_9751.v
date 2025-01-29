// Seed: 2803434291
module module_0 (
    input wor id_0,
    output supply0 id_1,
    input tri0 id_2,
    input tri0 id_3
);
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    input tri id_2,
    output wire id_3,
    output supply1 id_4,
    input tri1 id_5,
    input wire id_6,
    output tri1 id_7,
    input uwire id_8,
    input wor id_9,
    input wand id_10,
    input tri1 id_11,
    input wand id_12,
    input wor id_13,
    output tri1 id_14,
    input wire id_15,
    input tri1 id_16,
    input supply0 id_17,
    output tri0 id_18,
    input supply0 id_19,
    input uwire id_20,
    input wire id_21,
    output tri1 id_22
);
  assign id_22 = 1;
  wire id_24;
  xnor primCall (
      id_4,
      id_2,
      id_0,
      id_19,
      id_5,
      id_27,
      id_31,
      id_24,
      id_25,
      id_6,
      id_16,
      id_21,
      id_29,
      id_10,
      id_1,
      id_13,
      id_9,
      id_17,
      id_12,
      id_26,
      id_20,
      id_8,
      id_30
  );
  wand id_25, id_26, id_27;
  wire id_28;
  assign id_26 = -1;
  wire id_29, id_30;
  id_31(
      .id_0(1),
      .id_1(id_19),
      .id_2(id_16),
      .id_3(id_27 == id_10),
      .id_4(id_13),
      .id_5(-1'b0),
      .id_6(-1),
      .id_7(-1),
      .id_8(id_12),
      .id_9(id_20),
      .id_10(-1),
      .id_11(id_25),
      .id_12(1),
      .id_13(id_28),
      .id_14(1)
  );
  module_0 modCall_1 (
      id_6,
      id_14,
      id_5,
      id_11
  );
  assign modCall_1.id_0 = 0;
endmodule
