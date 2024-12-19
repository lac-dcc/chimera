// Seed: 2760976765
module module_0 (
    output uwire id_0,
    output wor id_1,
    input tri id_2,
    input uwire id_3,
    input tri id_4,
    output supply1 id_5,
    output tri id_6,
    output tri1 id_7,
    input uwire id_8,
    output tri id_9,
    input supply0 id_10,
    output uwire id_11,
    input wand id_12,
    output supply0 id_13,
    input supply0 id_14,
    output supply1 id_15,
    output supply0 id_16,
    input tri0 id_17,
    input wor id_18,
    output tri id_19,
    input wire id_20,
    output tri1 id_21,
    input uwire id_22,
    input tri0 id_23,
    input tri1 id_24
    , id_32,
    output tri0 id_25,
    output tri0 id_26
    , id_33,
    input supply1 id_27,
    input tri0 id_28,
    output tri0 id_29,
    input wand id_30
);
  assign module_1.id_20 = 0;
endmodule
module module_1 (
    output wor id_0,
    input tri1 id_1,
    input tri id_2,
    output uwire id_3,
    output tri id_4,
    input tri1 id_5,
    input uwire id_6,
    output wor id_7,
    output supply1 id_8,
    input tri1 id_9,
    output tri1 id_10,
    input uwire id_11,
    output tri0 id_12,
    input tri id_13,
    input tri id_14,
    input tri id_15,
    input wor id_16,
    output tri0 id_17,
    output tri id_18,
    output tri1 id_19,
    input tri1 id_20
);
  id_22(
      .id_0(id_1), .id_1(id_7)
  );
  assign id_0 = id_6 ? id_15 : 1;
  assign id_4 = 1;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_2,
      id_11,
      id_9,
      id_19,
      id_4,
      id_12,
      id_6,
      id_10,
      id_9,
      id_8,
      id_2,
      id_0,
      id_15,
      id_10,
      id_19,
      id_13,
      id_16,
      id_18,
      id_16,
      id_7,
      id_13,
      id_14,
      id_16,
      id_0,
      id_0,
      id_20,
      id_5,
      id_0,
      id_5
  );
  wire id_23;
  assign id_12 = 1 - id_15;
  wire id_24;
  wire id_25;
  wire id_26;
  wire id_27 = id_15;
  wire id_28;
  wire id_29;
  id_30(
      .id_0(id_18 - 1)
  );
endmodule
