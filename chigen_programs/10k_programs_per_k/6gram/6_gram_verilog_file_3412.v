// Seed: 2956387666
module module_0 (
    input wire id_0,
    output tri1 id_1,
    input tri1 id_2,
    input uwire module_0,
    output wor id_4,
    input wire id_5,
    input wand id_6,
    input uwire id_7,
    input tri1 id_8,
    input tri id_9,
    output tri0 id_10,
    input supply0 id_11,
    output wand id_12,
    input uwire id_13,
    input tri1 id_14,
    input wire id_15,
    output supply1 id_16
);
  wire id_18, id_19;
  always @(negedge id_7) release id_19[1'h0];
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1,
    input wire id_2,
    input supply1 id_3,
    input supply0 id_4,
    output supply1 id_5
);
  wire id_7;
  assign id_5 = 1;
  always @(negedge id_3) begin : LABEL_0
    disable id_8;
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_0,
      id_8,
      id_4,
      id_1,
      id_2,
      id_3,
      id_3,
      id_8,
      id_8,
      id_5,
      id_3,
      id_2,
      id_2,
      id_5
  );
  assign modCall_1.id_12 = 0;
endmodule
