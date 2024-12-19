// Seed: 3242799225
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input tri1 id_3,
    input uwire id_4,
    input wand id_5,
    input supply1 id_6,
    input wire id_7,
    input wor id_8,
    input tri id_9,
    inout tri id_10,
    input wire id_11,
    output supply0 id_12
    , id_24,
    input tri id_13,
    output wor id_14,
    input tri0 id_15,
    output uwire id_16,
    input wand id_17,
    output wand id_18,
    input tri0 id_19,
    output tri0 id_20,
    output tri id_21,
    output supply1 id_22
);
  wire id_25;
  assign id_24 = id_1;
  wire id_26;
  wire id_27;
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    output wire id_2,
    input wand id_3,
    input supply1 id_4,
    input tri id_5,
    input supply1 id_6,
    output tri1 id_7,
    input supply1 id_8,
    input wor id_9,
    output tri1 id_10,
    output tri1 id_11,
    input wand id_12,
    input tri id_13,
    input wand id_14,
    input wand id_15,
    output uwire id_16,
    input uwire id_17,
    input uwire id_18,
    input supply0 id_19,
    input tri1 id_20,
    input wor id_21,
    inout wire id_22,
    input wire id_23,
    input uwire id_24,
    input supply1 id_25,
    output tri1 id_26
);
  wire id_28;
  genvar id_29;
  assign id_26 = id_29[1];
  wire id_30;
  module_0 modCall_1 (
      id_6,
      id_15,
      id_2,
      id_22,
      id_22,
      id_25,
      id_6,
      id_19,
      id_17,
      id_24,
      id_22,
      id_9,
      id_10,
      id_17,
      id_26,
      id_6,
      id_2,
      id_12,
      id_2,
      id_5,
      id_2,
      id_11,
      id_2
  );
  assign modCall_1.id_16 = 0;
  assign id_10 = (1 != 1) & id_9;
  id_31(
      .id_0(id_32), .id_1(id_20), .id_2(id_13)
  );
endmodule
