// Seed: 2121886821
module module_0 (
    output wand id_0,
    output supply1 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply0 id_4,
    input wor id_5
    , id_14,
    input uwire id_6,
    input uwire id_7,
    input wor id_8,
    output tri id_9,
    input supply0 id_10,
    input wand id_11,
    input uwire id_12
);
  assign id_0 = id_5 && id_10 && 1'b0;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    input wire id_2,
    input uwire id_3,
    output supply0 id_4,
    input wire id_5,
    output wand id_6,
    input supply0 id_7,
    input wand id_8,
    output wor id_9,
    output supply0 id_10
    , id_16,
    input uwire id_11
    , id_17,
    output supply0 id_12,
    output tri id_13,
    input wor id_14
);
  always @(posedge id_17 <= 1'd0) begin : LABEL_0
    assign id_6 = 1 & $display;
  end
  module_0 modCall_1 (
      id_6,
      id_10,
      id_3,
      id_5,
      id_1,
      id_5,
      id_8,
      id_1,
      id_2,
      id_13,
      id_7,
      id_14,
      id_3
  );
endmodule
