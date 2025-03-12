// Seed: 3460949472
module module_0 (
    output wand id_0,
    input uwire id_1,
    output supply1 id_2,
    input tri id_3,
    input supply1 id_4,
    input wand id_5,
    input wire id_6,
    output uwire id_7,
    output uwire id_8,
    input wand id_9,
    input tri1 id_10,
    output tri1 id_11,
    input supply0 id_12,
    input uwire id_13,
    output wand id_14,
    input tri1 id_15,
    input tri1 id_16,
    input wor id_17,
    output tri1 id_18,
    output supply0 id_19,
    input supply1 id_20,
    output wire id_21
);
  assign id_18 = id_1;
endmodule
module module_1 (
    input wire id_0,
    input supply1 id_1,
    input uwire id_2,
    output wire id_3,
    input tri0 id_4,
    output tri0 id_5,
    input supply1 id_6,
    input tri id_7
);
  assign id_3 = id_6;
  reg id_9 = -1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_0,
      id_4,
      id_1,
      id_6,
      id_3,
      id_3,
      id_2,
      id_4,
      id_5,
      id_7,
      id_1,
      id_3,
      id_0,
      id_2,
      id_4,
      id_5,
      id_5,
      id_2,
      id_3
  );
  assign modCall_1.id_11 = 0;
  always @(posedge -1'b0) begin : LABEL_0
    id_9 = id_0;
  end
endmodule
