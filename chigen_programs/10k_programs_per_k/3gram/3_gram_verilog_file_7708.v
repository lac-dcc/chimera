// Seed: 1647795417
module module_0 (
    output supply1 id_0,
    output supply0 id_1,
    output wire id_2,
    input uwire id_3,
    input wand id_4,
    input wire id_5,
    input wor id_6,
    input tri id_7,
    output tri id_8,
    input supply1 id_9,
    output logic id_10,
    output tri0 id_11,
    input wor id_12,
    output tri1 id_13,
    input uwire id_14,
    input wand id_15
);
  wire id_17;
  wire id_18;
  initial begin : LABEL_0
    #1 id_10 <= id_6 - 1;
  end
  uwire id_19 = 1;
  wire  id_20;
endmodule
module module_1 (
    input supply1 id_0,
    input wire id_1,
    output uwire id_2
    , id_16,
    output supply0 id_3,
    output supply0 id_4,
    input wor id_5,
    input wire id_6,
    input supply1 id_7,
    input uwire id_8,
    input tri id_9
    , id_17,
    output tri id_10,
    output tri0 id_11,
    output logic id_12,
    input tri1 id_13,
    input supply1 id_14
);
  always id_12 <= 1'h0;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_3,
      id_5,
      id_1,
      id_5,
      id_8,
      id_1,
      id_2,
      id_7,
      id_12,
      id_2,
      id_5,
      id_2,
      id_1,
      id_13
  );
  assign modCall_1.type_25 = 0;
endmodule
