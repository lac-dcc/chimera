// Seed: 1589560060
module module_0 (
    input wire id_0,
    input supply0 id_1,
    input uwire id_2,
    input wand id_3,
    output supply0 id_4,
    input tri0 id_5,
    input uwire id_6,
    output tri id_7,
    input wire id_8,
    input wor id_9,
    input uwire id_10,
    input supply1 id_11,
    output wand id_12,
    input wor id_13,
    output supply0 id_14
);
  wire id_16, id_17;
  wire id_18;
  wire id_19;
  assign id_14 = id_0;
endmodule
module module_1 (
    output wand id_0,
    id_15,
    output tri0 id_1,
    input uwire id_2,
    output logic id_3,
    input supply1 id_4,
    output tri id_5,
    output supply1 id_6,
    output tri id_7,
    input tri0 void id_8,
    input supply0 id_9,
    input wor id_10,
    output tri0 id_11,
    input tri id_12,
    input supply1 id_13
);
  wire id_16;
  final begin : LABEL_0
    if ({id_8{-1}}) forever id_3 <= -1;
  end
  module_0 modCall_1 (
      id_9,
      id_10,
      id_2,
      id_10,
      id_1,
      id_2,
      id_8,
      id_5,
      id_12,
      id_8,
      id_12,
      id_8,
      id_6,
      id_10,
      id_1
  );
  assign modCall_1.id_14 = 0;
  tri0 id_17, id_18 = id_13;
endmodule
