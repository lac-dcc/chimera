// Seed: 3368311707
module module_0 (
    output tri id_0,
    input uwire id_1,
    inout supply0 id_2,
    input tri id_3,
    input tri id_4,
    input tri0 id_5,
    inout wor id_6,
    input uwire id_7,
    input wor id_8,
    output tri1 id_9,
    input uwire id_10,
    output supply1 id_11,
    output tri id_12,
    input supply1 id_13,
    input tri1 id_14,
    input tri id_15,
    output wire id_16,
    output supply0 id_17
);
  assign module_1.type_28 = 0;
  tri0 id_19 = id_13;
  id_20(
      .id_0(1'b0), .id_1(id_11), .id_2(id_12 !== 1), .id_3(1)
  );
endmodule
module module_1 (
    input wire id_0,
    input tri1 id_1,
    inout tri0 id_2,
    output wand id_3,
    output tri1 id_4,
    output supply1 id_5,
    input supply1 id_6,
    output supply1 id_7,
    input tri0 id_8,
    output supply0 id_9,
    input tri1 id_10,
    input tri0 id_11,
    input tri id_12,
    output tri0 id_13,
    output wand id_14,
    input wor id_15,
    output tri id_16,
    input wand id_17,
    output wire id_18
);
  module_0 modCall_1 (
      id_4,
      id_10,
      id_2,
      id_17,
      id_1,
      id_6,
      id_2,
      id_11,
      id_2,
      id_3,
      id_8,
      id_13,
      id_13,
      id_6,
      id_11,
      id_10,
      id_16,
      id_7
  );
  uwire id_20;
  assign id_16 = id_20;
  wire  id_21;
  uwire id_22 = id_15 != id_1;
endmodule
