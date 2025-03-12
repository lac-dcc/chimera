// Seed: 2190551453
module module_0 (
    output wire id_0,
    input tri0 id_1,
    output uwire id_2,
    input wand id_3,
    output supply1 id_4,
    output tri0 id_5,
    input uwire id_6,
    input wire id_7,
    input uwire id_8,
    input uwire id_9,
    input supply0 id_10,
    input wire id_11,
    output wand id_12,
    output supply1 id_13,
    input tri1 id_14,
    output supply1 id_15,
    input supply0 id_16,
    output wand id_17,
    input tri1 id_18,
    input wor id_19
);
  wire id_21;
endmodule
module module_1 (
    output supply1 id_0,
    output logic id_1,
    output tri1 id_2,
    output wand id_3,
    output uwire id_4,
    input supply0 id_5
);
  initial
    #(id_5) begin : LABEL_0
      id_1 = id_5;
    end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_2,
      id_5,
      id_0,
      id_3,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_2,
      id_3,
      id_5,
      id_4,
      id_5,
      id_4,
      id_5,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
