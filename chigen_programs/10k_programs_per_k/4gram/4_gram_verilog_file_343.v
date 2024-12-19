// Seed: 1183031618
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  initial assert (1'b0);
endmodule
module module_1 (
    output wire id_0,
    input wire id_1,
    output wand id_2,
    input supply0 id_3,
    output wand id_4,
    output wor id_5,
    input tri id_6,
    output tri0 id_7,
    input supply1 id_8,
    input supply0 id_9,
    input supply1 id_10,
    input tri0 id_11,
    input tri0 id_12,
    input tri1 id_13,
    input tri0 id_14,
    input tri id_15,
    output tri id_16,
    output tri1 id_17,
    output supply1 id_18,
    output tri1 id_19
);
  generate
    begin : LABEL_0
      wire id_21 = id_10;
      assign id_17 = 1;
    end
  endgenerate
  assign id_17 = 1'b0;
  nand primCall (
      id_2, id_1, id_8, id_14, id_9, id_22, id_21, id_3, id_11, id_13, id_15, id_12, id_10, id_6
  );
  wire id_22;
  module_0 modCall_1 (
      id_22,
      id_22,
      id_22
  );
  assign id_0 = id_6 >>> ~id_13 ? id_9 : 1'b0;
endmodule
