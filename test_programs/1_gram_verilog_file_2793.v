// Seed: 1931890842
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input tri1 id_2,
    output supply1 id_3,
    input uwire id_4,
    output wor id_5,
    input tri id_6,
    input wor id_7,
    output wor id_8,
    input wor id_9,
    inout uwire id_10,
    input uwire id_11,
    output wire id_12,
    input tri id_13 id_26,
    output tri id_14,
    input wand id_15,
    input supply1 id_16,
    input wor id_17,
    output supply1 id_18,
    output tri0 id_19,
    output wor id_20,
    input tri0 id_21,
    input wire id_22,
    input wire id_23,
    output wire id_24
);
  id_27(
      .id_0(id_4), .id_1(id_8), .id_2(id_11)
  );
  assign id_14 = -1 <-> id_17;
endmodule
module module_1 (
    output wand id_0,
    output supply1 id_1,
    input tri0 id_2,
    output logic id_3
);
  wire id_5;
  initial id_3 <= 1;
  tri id_6, id_7 = id_2;
  always id_3 <= #1  !id_6;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_0,
      id_6,
      id_0,
      id_6,
      id_6,
      id_0,
      id_6,
      id_7,
      id_2,
      id_7,
      id_7,
      id_1,
      id_7,
      id_2,
      id_6,
      id_1,
      id_7,
      id_1,
      id_6,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.type_3 = 0;
  tri1 id_8 = id_2;
endmodule
