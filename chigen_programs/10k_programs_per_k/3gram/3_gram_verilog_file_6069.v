// Seed: 3914530589
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input supply0 id_2,
    input wand id_3,
    input wor id_4,
    output wor id_5,
    input tri0 id_6,
    input tri0 id_7,
    input wand id_8,
    output tri1 id_9,
    input tri1 id_10,
    input wor id_11,
    input wand id_12
);
  assign id_5 = id_11;
  wire id_14;
  wire id_15;
  wire id_16;
  wire id_17;
  assign id_9 = 1;
  wire id_18;
endmodule
module module_1 (
    output tri1 id_0,
    input wor id_1,
    input tri0 id_2,
    input supply1 id_3,
    output logic id_4,
    output wand id_5,
    input logic id_6
);
  always_ff @(1 or id_6) begin : LABEL_0
    id_5 = 1'h0;
    id_4 <= id_6;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_3,
      id_2,
      id_3,
      id_0,
      id_1,
      id_1,
      id_2,
      id_5,
      id_3,
      id_2,
      id_2
  );
  assign modCall_1.type_5 = 0;
endmodule
