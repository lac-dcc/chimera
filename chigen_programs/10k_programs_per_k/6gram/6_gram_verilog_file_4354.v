// Seed: 3594214086
module module_0 (
    input tri0 id_0,
    input tri id_1,
    output tri id_2,
    output supply1 id_3,
    input uwire id_4,
    input tri0 id_5,
    input wor id_6,
    input tri1 id_7,
    input wor id_8,
    input tri0 id_9,
    output tri0 id_10,
    input tri0 id_11,
    input wand id_12,
    input tri1 id_13,
    input tri0 id_14,
    input wor id_15,
    input uwire id_16,
    output wand id_17,
    input tri0 id_18,
    input wire id_19,
    input tri0 id_20,
    input wire id_21,
    output wor id_22,
    input wire id_23,
    input tri1 id_24,
    output supply0 id_25,
    output wand id_26,
    input wand id_27
);
  supply1 id_29 = id_21;
  assign id_2 = id_24;
  assign id_3 = 1;
  wire id_30;
  assign id_25 = id_19;
  wire id_31;
endmodule
module module_1 (
    output wor id_0,
    input tri1 id_1,
    output tri id_2,
    input supply1 id_3,
    input supply0 id_4
    , id_8,
    input tri id_5,
    output wand id_6
);
  wire id_9;
  id_10(
      .id_0(1'h0), .id_1(id_0), .id_2(1), .id_3(1), .id_4(1), .id_5(), .id_6(id_3), .id_7()
  );
  module_0 modCall_1 (
      id_1,
      id_5,
      id_6,
      id_6,
      id_4,
      id_5,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_4,
      id_5,
      id_1,
      id_4,
      id_3,
      id_5,
      id_2,
      id_3,
      id_1,
      id_3,
      id_5,
      id_2,
      id_3,
      id_5,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.id_11 = 0;
  wire id_11;
  id_12(
      id_2, id_0, 1
  );
endmodule
