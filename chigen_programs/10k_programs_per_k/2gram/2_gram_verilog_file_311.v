// Seed: 759539922
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    output wire id_2,
    output wand id_3,
    input tri id_4,
    output uwire id_5,
    output supply0 id_6,
    input supply0 id_7,
    input tri id_8,
    output wand id_9,
    input tri0 id_10,
    output supply1 id_11,
    input supply0 id_12,
    output tri id_13,
    input uwire id_14,
    output supply0 id_15,
    input supply1 id_16,
    output tri id_17,
    input supply1 id_18,
    input wor id_19
);
  assign id_15 = 1;
  assign id_3 = 1'b0;
  assign module_1.id_1 = 0;
  wire id_21;
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri1  id_1,
    output wand  id_2,
    output logic id_3,
    output wand  id_4,
    input  tri   id_5,
    input  wand  id_6
);
  always begin : LABEL_0
    id_3 <= 1'b0;
  end
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_2,
      id_5,
      id_2,
      id_4,
      id_1,
      id_0,
      id_4,
      id_0,
      id_2,
      id_6,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_6
  );
endmodule
