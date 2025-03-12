// Seed: 2931378952
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    input tri id_2,
    input wor id_3,
    input tri id_4,
    output tri1 id_5,
    output wand id_6,
    input supply0 id_7,
    input supply0 id_8,
    input tri0 id_9,
    input supply1 id_10,
    input supply1 id_11,
    input uwire id_12,
    input uwire id_13
);
  assign id_6 = id_2;
endmodule
module module_1 (
    output tri id_0,
    input wor id_1,
    output tri id_2,
    input supply1 id_3,
    input supply1 id_4,
    input wor id_5,
    output supply1 id_6,
    input uwire id_7,
    input uwire id_8,
    output supply1 id_9,
    output logic id_10
);
  wire id_12;
  always begin : LABEL_0
    id_10 <= 1'd0;
  end
  module_0 modCall_1 (
      id_9,
      id_4,
      id_8,
      id_5,
      id_1,
      id_2,
      id_9,
      id_7,
      id_1,
      id_8,
      id_3,
      id_1,
      id_5,
      id_7
  );
  assign modCall_1.id_8 = 0;
endmodule
