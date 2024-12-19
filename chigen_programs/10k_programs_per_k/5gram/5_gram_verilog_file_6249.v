// Seed: 2457497128
module module_0 (
    output supply1 id_0,
    output wire id_1,
    input tri1 id_2,
    input wor id_3,
    input supply1 id_4,
    output tri0 id_5,
    output wor id_6,
    input tri id_7,
    input wor id_8,
    input uwire id_9,
    input supply1 id_10,
    output wor id_11,
    input tri id_12,
    output tri0 id_13,
    output uwire id_14,
    input wor id_15,
    input uwire id_16,
    input wire id_17
    , id_31,
    input supply1 id_18,
    input uwire id_19,
    input wor id_20,
    output tri1 id_21,
    input wand id_22,
    input uwire id_23,
    input tri1 id_24,
    input supply1 id_25,
    output wand id_26,
    output wor id_27,
    output supply0 id_28,
    output wand id_29
);
  wire id_32;
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    input tri id_2,
    output supply0 id_3
);
  assign id_3 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_2,
      id_2,
      id_3,
      id_3,
      id_1,
      id_2,
      id_0,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_3,
      id_0,
      id_0,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_12 = 0;
  genvar id_5;
  always @(posedge 1) begin : LABEL_0
    id_3#(.id_0((1'd0))) = 1;
    id_5 <= id_5;
  end
  wire id_6;
endmodule
