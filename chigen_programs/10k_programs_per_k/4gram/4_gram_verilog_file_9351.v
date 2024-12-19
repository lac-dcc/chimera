// Seed: 3609459848
module module_0 (
    input wand id_0,
    input wor id_1,
    input tri1 id_2,
    input tri1 id_3,
    input wand id_4,
    output uwire id_5,
    output tri1 id_6,
    output wire id_7,
    input supply1 id_8,
    output supply0 id_9,
    output tri0 id_10,
    input wand id_11,
    input wire id_12
    , id_18,
    input tri0 id_13,
    input wor id_14,
    output tri1 id_15,
    input tri0 id_16
);
  tri1 id_19;
  assign id_19 = 1;
  wire id_20;
  wire id_21;
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    output tri0 id_2,
    output wand id_3,
    input tri id_4,
    output logic id_5,
    input tri id_6,
    output wire id_7,
    output supply1 id_8,
    input tri id_9
);
  always_latch @(posedge id_1) begin : LABEL_0
    if (id_0) id_5 <= 1;
  end
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_9,
      id_9,
      id_2,
      id_8,
      id_8,
      id_0,
      id_8,
      id_3,
      id_9,
      id_6,
      id_0,
      id_4,
      id_3,
      id_9
  );
  assign modCall_1.id_10 = 0;
endmodule
