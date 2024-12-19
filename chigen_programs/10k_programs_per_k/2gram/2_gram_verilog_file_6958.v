// Seed: 810573673
module module_0 (
    output wand id_0,
    input wand id_1,
    input tri id_2,
    output supply1 id_3,
    input supply0 id_4,
    input wand id_5,
    input wand id_6,
    input wand id_7,
    input tri id_8,
    input supply0 id_9,
    input wor id_10,
    output tri id_11,
    output wor id_12,
    output uwire id_13,
    input uwire id_14
);
  assign id_3 = id_5;
  wand id_16;
  generate
    assign id_16 = id_8;
  endgenerate
  wire id_17;
  wire id_18;
  wire id_19 = id_17;
endmodule
module module_1 (
    input wor id_0,
    output tri0 id_1,
    input wand id_2,
    output tri0 id_3,
    input wire id_4,
    inout wor id_5,
    input wor id_6,
    output logic id_7,
    input supply0 id_8,
    input wor id_9,
    output wor id_10,
    input supply0 id_11,
    output tri1 id_12,
    input supply1 id_13,
    output tri0 id_14
);
  supply0 id_16;
  assign id_14 = id_13;
  xor primCall (id_10, id_4, id_0, id_8, id_9, id_5, id_11, id_2, id_17, id_16, id_18, id_6, id_13);
  wire id_17;
  wire id_18;
  always id_7 <= 1'b0;
  module_0 modCall_1 (
      id_14,
      id_2,
      id_6,
      id_3,
      id_2,
      id_13,
      id_4,
      id_5,
      id_11,
      id_5,
      id_5,
      id_5,
      id_14,
      id_12,
      id_4
  );
  assign modCall_1.id_2 = 0;
  id_19(
      .id_0(1), .id_1(), .id_2(id_18), .id_3(id_2)
  );
endmodule
