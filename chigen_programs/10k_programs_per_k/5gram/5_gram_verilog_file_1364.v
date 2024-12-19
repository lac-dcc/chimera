// Seed: 3021299748
module module_0 (
    input tri id_0,
    input tri0 id_1,
    output supply1 id_2,
    output tri0 id_3,
    input wor id_4,
    output tri1 id_5,
    input supply0 id_6,
    output tri0 id_7,
    input wor id_8,
    input supply0 id_9,
    input tri0 id_10,
    output tri0 id_11,
    output wand id_12,
    input uwire id_13,
    input supply1 id_14,
    output tri id_15,
    output supply1 id_16,
    output tri id_17
);
  wand id_19 = id_14 == 1;
  wire id_20, id_21, id_22 = 1;
  wire id_23;
  wire id_24 = id_24;
  assign module_1.type_21 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    output wand id_2,
    input supply1 id_3,
    input wire id_4,
    input wand id_5,
    input tri0 id_6,
    input tri1 id_7,
    output tri0 id_8,
    input supply1 id_9,
    output wor id_10,
    input tri id_11,
    output tri id_12,
    input wire id_13,
    inout supply0 id_14
);
  wire id_16;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_14,
      id_10,
      id_1,
      id_2,
      id_11,
      id_12,
      id_14,
      id_14,
      id_3,
      id_8,
      id_12,
      id_11,
      id_1,
      id_14,
      id_12,
      id_14
  );
  always @* begin : LABEL_0
    id_2 = id_13;
  end
  assign id_12 = id_1;
endmodule
