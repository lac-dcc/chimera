// Seed: 2746727640
module module_0 (
    output wand id_0,
    input wand id_1,
    output supply1 id_2,
    output supply0 id_3,
    input tri1 id_4,
    input wire id_5,
    input wor id_6,
    input wire id_7,
    output tri0 id_8,
    input uwire id_9,
    input wand id_10
    , id_18,
    input wand id_11,
    output tri id_12,
    input tri0 id_13,
    input wire id_14,
    output wor id_15,
    output wor id_16
);
  wire id_19;
  assign id_0 = (id_13);
endmodule
module module_1 (
    output logic id_0,
    output wor id_1,
    input supply1 id_2,
    input logic id_3,
    input wire id_4
);
  always begin : LABEL_0
    id_0 <= id_3;
  end
  assign id_1 = 1'b0;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1,
      id_4,
      id_2,
      id_2,
      id_4,
      id_1,
      id_4,
      id_2,
      id_4,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_5 = 0;
endmodule
