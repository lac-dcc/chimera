// Seed: 1402819016
module module_0 (
    output uwire id_0,
    input tri1 id_1,
    input wor id_2,
    input tri id_3,
    input uwire id_4,
    input tri id_5,
    input supply1 id_6,
    inout wire id_7,
    input tri1 id_8,
    output supply0 id_9,
    input wand id_10,
    input uwire id_11,
    output wand id_12,
    output wand id_13,
    input tri id_14
);
  wire id_16;
endmodule
module module_1 (
    output wor id_0,
    input tri1 id_1,
    input supply0 id_2,
    output wand id_3,
    output wand id_4,
    output wor id_5,
    output supply0 id_6
    , id_17,
    output supply1 id_7,
    input wire id_8,
    output supply1 id_9,
    input supply0 id_10,
    output tri1 id_11,
    input uwire id_12,
    inout wire id_13,
    input wand id_14,
    output tri0 id_15
);
  always @(posedge -1'h0) begin : LABEL_0
    if (-1) begin : LABEL_1
      $unsigned(0);
      ;
    end
  end
  module_0 modCall_1 (
      id_6,
      id_8,
      id_13,
      id_12,
      id_1,
      id_14,
      id_8,
      id_13,
      id_2,
      id_7,
      id_14,
      id_14,
      id_3,
      id_0,
      id_1
  );
  assign modCall_1.id_3 = 0;
  assign id_0 = id_14;
  logic id_18;
  localparam id_19 = 1;
endmodule
