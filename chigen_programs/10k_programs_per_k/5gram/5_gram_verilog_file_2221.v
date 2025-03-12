// Seed: 2940484180
module module_0 (
    input wand id_0,
    input uwire id_1,
    input wand id_2,
    output tri1 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input tri id_6,
    input uwire id_7,
    input tri id_8,
    input tri1 id_9,
    input wand id_10,
    input supply1 id_11,
    output tri0 id_12,
    output tri1 id_13,
    output wor id_14,
    output wor id_15,
    input wire id_16,
    output logic id_17
);
  assign id_15 = 1'b0;
  assign id_17 = 1 != 1;
  always_latch @(*) id_17 = 1'b0;
endmodule
module module_1 #(
    parameter id_3 = 32'd21
) (
    input supply0 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input tri0 _id_3,
    input supply1 id_4,
    input tri1 id_5,
    output logic id_6,
    output tri0 id_7,
    output logic id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_2,
      id_5,
      id_5,
      id_5,
      id_1,
      id_0,
      id_0,
      id_4,
      id_0,
      id_7,
      id_7,
      id_2,
      id_7,
      id_1,
      id_8
  );
  always @(*) begin : LABEL_0
    id_8 <= id_5;
  end
  wire [-1 'b0 : id_3] id_11;
  always @(negedge id_10 != id_11 * id_0 <= id_0 or posedge id_10) begin : LABEL_1
    id_6 = -1;
  end
endmodule
