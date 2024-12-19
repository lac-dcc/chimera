// Seed: 1075157083
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    input uwire id_2,
    output supply1 id_3,
    output tri1 id_4,
    input tri1 id_5,
    input tri id_6,
    output tri1 id_7,
    output wor id_8,
    input tri id_9,
    input tri1 id_10,
    input supply0 id_11,
    output wand id_12,
    output uwire id_13,
    input supply0 id_14,
    input wire id_15,
    output tri0 id_16,
    input supply0 id_17,
    input tri0 id_18,
    input supply1 id_19,
    input tri1 id_20,
    input supply0 id_21,
    output wor id_22,
    input wor id_23,
    input supply0 id_24
);
  always @(posedge id_15 or negedge 1) begin : LABEL_0$display
    ;
  end
  wire id_26;
  assign id_7 = 1;
  wor id_27 = 1;
  assign id_7 = id_6;
endmodule
module module_1 (
    output uwire id_0,
    input wire id_1,
    output wand id_2,
    input wire id_3,
    output wor id_4,
    output uwire id_5,
    input wire id_6,
    input tri1 id_7,
    input supply0 id_8,
    input supply1 id_9,
    inout tri id_10,
    input tri id_11,
    input supply1 id_12,
    output tri0 id_13,
    input wor id_14,
    input tri1 id_15,
    input uwire id_16
);
  wire id_18;
  and primCall (id_2, id_6, id_9, id_14, id_18, id_8, id_12, id_10, id_3, id_15, id_1);
  module_0 modCall_1 (
      id_15,
      id_2,
      id_6,
      id_2,
      id_2,
      id_3,
      id_6,
      id_10,
      id_2,
      id_10,
      id_10,
      id_15,
      id_5,
      id_2,
      id_10,
      id_11,
      id_4,
      id_10,
      id_8,
      id_12,
      id_6,
      id_8,
      id_0,
      id_12,
      id_11
  );
  assign modCall_1.id_10 = 0;
endmodule
