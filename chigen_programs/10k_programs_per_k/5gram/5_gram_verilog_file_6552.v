// Seed: 354266300
module module_0 (
    input wand id_0,
    output tri0 id_1,
    input tri0 id_2,
    output tri id_3,
    input wire id_4,
    input tri id_5,
    input tri0 id_6,
    input uwire id_7,
    output tri1 id_8,
    output wand id_9,
    output tri0 id_10,
    output wire id_11,
    output wand id_12,
    input wire id_13,
    output tri0 id_14,
    output tri0 id_15,
    input supply0 id_16,
    input tri0 id_17
);
  parameter id_19 = 1;
  wire id_20, id_21;
  assign id_10 = id_2;
  generate
    assign id_1 = 1'b0;
  endgenerate
endmodule
module module_1 (
    output wor id_0,
    input supply1 id_1
    , id_3
);
  reg id_4;
  ;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.id_15 = 0;
  always @(posedge id_1 or 'd0) begin : LABEL_0
    id_3 <= (id_1) ~^ id_3;
    if (1) id_4 <= 1'b0 & 1 & 1 & 1;
  end
  assign id_4 = {id_4 == -1} == id_3 < id_4, id_0 = id_1;
  parameter id_5 = 1'd0;
  always @(1 or posedge -1) begin : LABEL_1
    id_4 <= -1;
  end
  always_latch @(posedge 1 or posedge 1'h0) begin : LABEL_2
    id_4 <= -1;
  end
  assign id_4 = 1 - 1 & 1;
endmodule
