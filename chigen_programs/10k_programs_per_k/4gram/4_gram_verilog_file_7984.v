// Seed: 51646815
module module_0 (
    input tri id_0,
    output supply0 id_1,
    input wire id_2,
    input tri0 id_3,
    input uwire id_4,
    input wand id_5,
    output wand id_6,
    input uwire id_7,
    input wor id_8,
    output tri id_9,
    output tri id_10,
    input wor id_11
);
  assign id_9 = id_11;
  wire id_13;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    output wand id_2,
    input wire id_3,
    input tri id_4,
    input tri0 id_5,
    output supply0 id_6,
    input tri0 id_7,
    input supply0 id_8,
    input wand id_9,
    input tri0 id_10,
    input tri1 id_11,
    input wire id_12,
    output logic id_13,
    input supply1 id_14
);
  parameter id_16 = 1;
  module_0 modCall_1 (
      id_9,
      id_2,
      id_14,
      id_5,
      id_1,
      id_3,
      id_2,
      id_4,
      id_14,
      id_2,
      id_2,
      id_8
  );
  final begin : LABEL_0
    #1 id_13 <= id_3;
  end
endmodule
