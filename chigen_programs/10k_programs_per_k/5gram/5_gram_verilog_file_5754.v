// Seed: 1210922902
module module_0 (
    input wor id_0,
    input supply1 id_1,
    input wor id_2,
    input wand id_3,
    input supply1 id_4,
    input wor id_5,
    output tri1 id_6,
    input wor id_7,
    input tri0 id_8,
    output uwire id_9,
    input tri id_10,
    output wor id_11,
    output wor id_12
);
  uwire id_14;
  always_latch @(id_14++) id_6 = module_0 != 1'h0;
  uwire id_15 = 1'd0;
  reg   id_16;
  generate
    for (id_17 = id_7; 1'b0 == id_7; id_16 = 1) begin : LABEL_0
      initial begin : LABEL_0
        id_6 = id_15;
      end
      always @(posedge 1 < id_17) begin : LABEL_0
        id_16 <= 1;
      end
      wire id_18;
    end
  endgenerate
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    input wire id_2,
    input wand id_3,
    input tri id_4,
    output tri1 id_5,
    input wor id_6,
    input tri id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_0,
      id_3,
      id_3,
      id_5,
      id_6,
      id_3,
      id_5,
      id_4,
      id_5,
      id_5
  );
  assign modCall_1.id_8 = 0;
  wand id_10 = 1 == id_7;
endmodule
