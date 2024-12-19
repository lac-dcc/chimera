// Seed: 1550627594
module module_0 (
    output uwire id_0,
    input wor id_1,
    input wor id_2,
    input supply0 id_3,
    output tri1 id_4,
    output supply1 id_5,
    output uwire id_6,
    input uwire id_7,
    output tri0 id_8,
    input tri1 id_9,
    input tri1 id_10,
    output wand id_11,
    output uwire id_12,
    input supply0 id_13
);
  wire id_15;
  tri1 id_16 = id_13;
endmodule
module module_1 (
    output logic id_0,
    output tri0 id_1,
    output supply1 id_2,
    input logic id_3,
    input tri id_4,
    input supply0 id_5,
    output tri1 id_6,
    input tri id_7,
    input wor id_8,
    output wire id_9,
    output logic id_10,
    output wor id_11,
    output wand id_12,
    output supply1 id_13
    , id_15
);
  generate
    always_latch @(posedge 1 < id_15) begin : LABEL_0
      id_0 <= id_3;
    end
    always @(posedge 1 or posedge 1) begin : LABEL_0
      id_15 <= 1'b0 - id_7.id_15;
      $display(1 & 1 & 1 & 1'b0 & id_7);
      id_10 <= 1;
    end
  endgenerate
  module_0 modCall_1 (
      id_6,
      id_8,
      id_4,
      id_4,
      id_9,
      id_2,
      id_2,
      id_4,
      id_1,
      id_5,
      id_4,
      id_2,
      id_6,
      id_8
  );
  assign modCall_1.type_2 = 0;
endmodule
