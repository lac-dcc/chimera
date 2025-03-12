// Seed: 1732263657
module module_0 (
    input uwire id_0,
    input wire id_1,
    output supply1 id_2,
    input tri id_3,
    output tri id_4,
    output tri0 id_5,
    input tri1 id_6,
    input tri0 id_7,
    input uwire id_8,
    output supply1 id_9,
    input supply0 id_10,
    output supply0 id_11,
    input wor id_12,
    input wire id_13,
    output supply1 id_14,
    input wor id_15,
    input tri0 id_16,
    input uwire id_17,
    input tri0 id_18,
    input supply1 id_19,
    output supply0 id_20,
    input supply1 id_21,
    output tri0 id_22,
    input wire id_23,
    input wire id_24,
    input wor id_25,
    output wand id_26
);
  assign id_14 = id_16;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    input tri1 id_4,
    output logic id_5
);
  initial begin : LABEL_0
    id_5 <= id_3;
    $clog2(34);
    ;
  end
  module_0 modCall_1 (
      id_2,
      id_4,
      id_0,
      id_1,
      id_0,
      id_0,
      id_4,
      id_4,
      id_2,
      id_0,
      id_4,
      id_0,
      id_1,
      id_3,
      id_0,
      id_4,
      id_4,
      id_4,
      id_2,
      id_3,
      id_0,
      id_4,
      id_0,
      id_1,
      id_1,
      id_4,
      id_0
  );
endmodule
