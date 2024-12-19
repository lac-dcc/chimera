// Seed: 512174680
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input wor id_2,
    input wor id_3,
    output supply0 id_4,
    input wand id_5,
    input wand id_6,
    output tri0 id_7,
    input tri id_8,
    input tri0 id_9,
    output supply0 id_10,
    input supply1 id_11,
    input supply0 id_12,
    output supply0 id_13,
    output wand id_14
);
  assign id_10 = (1'b0 && id_11 && id_8 && 1 && id_0);
endmodule
module module_1 (
    output wire id_0,
    output wor id_1,
    input tri0 id_2,
    input wand id_3,
    output tri0 id_4,
    output uwire id_5,
    input tri id_6,
    input wand id_7,
    input tri0 id_8,
    output supply1 id_9,
    input tri1 id_10,
    output logic id_11,
    input uwire id_12,
    output tri id_13
);
  always begin : LABEL_0
    id_11 <= 1;
  end
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_12,
      id_6,
      id_9,
      id_2,
      id_7,
      id_4,
      id_10,
      id_12,
      id_9,
      id_7,
      id_7,
      id_1,
      id_4
  );
  assign modCall_1.type_2 = 0;
  assign id_9 = id_10;
  assign id_13 = 1;
endmodule
