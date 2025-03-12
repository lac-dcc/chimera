// Seed: 1403494834
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input supply0 id_2,
    input wand id_3,
    output tri1 id_4,
    input tri1 id_5,
    input uwire id_6,
    input wor id_7,
    input uwire id_8,
    input tri id_9,
    output tri id_10,
    input tri1 id_11,
    input wand id_12,
    output wire id_13,
    input supply1 id_14,
    output wire id_15,
    output supply1 id_16,
    input wand id_17,
    input wire id_18,
    output wire id_19
    , id_23,
    output tri0 id_20,
    input wor id_21
);
  assign id_16 = id_1;
  assign id_13 = -1'h0 - -1;
endmodule
module module_1 (
    output logic id_0,
    input tri1 id_1,
    output supply0 id_2,
    input supply0 id_3,
    output tri id_4,
    output supply0 id_5
);
  always @(*) begin : LABEL_0
    id_0 = 1;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_1,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_5,
      id_1,
      id_1,
      id_2,
      id_3,
      id_4,
      id_5,
      id_3,
      id_1,
      id_4,
      id_4,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
