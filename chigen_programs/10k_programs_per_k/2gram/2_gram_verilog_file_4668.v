// Seed: 2957606085
module module_0 (
    output supply1 id_0,
    input uwire id_1,
    input tri1 id_2,
    input supply0 id_3
);
  assign id_0 = (id_1);
  if (1) begin : LABEL_0
    assign id_0 = (id_3);
  end
endmodule
module module_1 (
    output supply1 id_0,
    output supply0 id_1,
    input tri0 id_2,
    output wand id_3,
    output wor id_4,
    output tri1 id_5,
    input tri id_6,
    output tri0 id_7,
    output supply1 id_8,
    output wire id_9,
    output supply1 id_10,
    input tri1 id_11,
    output tri id_12,
    input tri0 id_13,
    input supply0 id_14,
    input supply1 id_15,
    output supply0 id_16,
    input supply1 id_17
);
  logic id_19;
  ;
  xnor primCall (id_5, id_17, id_2, id_11, id_15, id_6, id_19, id_13, id_14);
  module_0 modCall_1 (
      id_4,
      id_13,
      id_6,
      id_17
  );
  assign modCall_1.id_2 = 0;
  assign id_19 = -1 ? id_13 : 1'h0 >= 1 & id_17 & id_2;
  wire id_20;
  wire [1 : 1] id_21;
endmodule
