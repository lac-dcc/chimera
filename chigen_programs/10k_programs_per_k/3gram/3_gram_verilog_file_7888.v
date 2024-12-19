// Seed: 765974286
module module_0 (
    output wand id_0,
    output tri id_1,
    input wor id_2,
    input supply0 id_3,
    input supply1 id_4,
    output wand id_5,
    output supply1 id_6,
    output uwire id_7,
    output uwire id_8,
    input wor id_9
);
  reg id_11;
  reg id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22;
  assign id_17 = 1'b0;
  wire id_23;
  wire id_24;
  always @(posedge (1) or negedge 1'b0 & id_23) begin : LABEL_0
    id_22 <= id_11;
  end
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    input tri1 id_2,
    input wand id_3,
    inout uwire id_4,
    output tri0 id_5,
    input supply0 id_6,
    input wor id_7,
    input wire id_8,
    input wire id_9,
    input tri0 id_10,
    output wor id_11,
    output tri0 id_12,
    input supply1 id_13,
    output wor id_14,
    output supply1 id_15,
    output tri0 id_16,
    input wand id_17,
    output supply1 id_18,
    input wire id_19,
    output wor id_20,
    output supply0 id_21,
    input supply0 id_22,
    output supply1 id_23,
    output supply1 id_24,
    output wire id_25,
    output uwire id_26,
    input uwire id_27,
    output tri id_28,
    input tri id_29,
    input tri0 id_30,
    output tri1 id_31,
    input tri0 id_32,
    input tri0 id_33,
    output supply1 id_34
);
  assign id_15 = 1 & 1;
  and primCall (
      id_16,
      id_30,
      id_13,
      id_1,
      id_17,
      id_2,
      id_3,
      id_7,
      id_27,
      id_0,
      id_29,
      id_4,
      id_10,
      id_8,
      id_19,
      id_6
  );
  module_0 modCall_1 (
      id_4,
      id_16,
      id_2,
      id_32,
      id_10,
      id_24,
      id_5,
      id_4,
      id_4,
      id_9
  );
  assign modCall_1.type_27 = 0;
  supply0 id_36 = 1;
endmodule
