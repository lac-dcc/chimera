// Seed: 3563909317
module module_0 (
    input wor id_0,
    output wire id_1,
    output wand id_2,
    input tri id_3,
    output uwire id_4,
    output uwire id_5,
    output wor id_6,
    output wor id_7,
    input supply0 id_8,
    output supply1 id_9,
    input wand id_10,
    input supply1 id_11,
    input supply0 id_12,
    input supply1 id_13,
    output tri id_14
);
  wor id_16 = id_11;
  assign id_1 = 1'd0;
  wire id_17;
  assign id_9 = 1;
endmodule
module module_1 (
    input uwire id_0,
    input tri id_1,
    input tri id_2,
    input tri0 id_3,
    output uwire id_4,
    input wor id_5,
    output wor id_6,
    input tri1 id_7,
    input supply0 id_8,
    input uwire id_9,
    input supply0 id_10,
    output tri1 id_11
);
  assign id_4 = 1 ? 1'h0 : 1;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_4,
      id_5,
      id_6,
      id_11,
      id_4,
      id_4,
      id_1,
      id_11,
      id_0,
      id_1,
      id_5,
      id_7,
      id_11
  );
  assign modCall_1.id_13 = 0;
  logic [7:0] id_13;
  tri0 id_14;
  for (id_15 = id_10; 1; id_14 = 1'b0) begin : LABEL_0
    assign id_6 = 1;
    assign id_13[1'b0] = id_1;
  end
  assign id_4 = 1;
  wire id_16;
endmodule
