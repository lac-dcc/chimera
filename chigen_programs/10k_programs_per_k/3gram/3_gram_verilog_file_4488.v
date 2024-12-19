// Seed: 4251493971
module module_0 (
    output supply1 id_0,
    output supply0 id_1,
    input wor id_2,
    input supply1 id_3,
    output wor id_4,
    output tri id_5,
    output uwire id_6,
    output tri0 id_7,
    input tri id_8,
    inout wire id_9,
    output supply0 id_10,
    output wor id_11
    , id_18,
    output tri0 id_12,
    input tri1 id_13,
    input tri0 id_14,
    output wire id_15,
    input supply0 id_16
);
  wire id_19;
  wire id_20;
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    output uwire id_2,
    output tri0 id_3,
    input wor id_4,
    input wire id_5
    , id_14,
    input wand id_6,
    input tri id_7,
    input tri0 id_8,
    output tri id_9,
    output wire id_10,
    input tri0 id_11,
    output logic id_12
);
  initial begin : LABEL_0
    id_12 <= 1;
    id_14 = id_4;
  end
  module_0 modCall_1 (
      id_3,
      id_10,
      id_6,
      id_7,
      id_9,
      id_9,
      id_14,
      id_14,
      id_4,
      id_14,
      id_10,
      id_3,
      id_9,
      id_14,
      id_11,
      id_2,
      id_6
  );
  assign modCall_1.type_2 = 0;
  wire id_15;
endmodule
