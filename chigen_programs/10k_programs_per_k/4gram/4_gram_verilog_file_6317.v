// Seed: 490048397
module module_0 (
    output tri1 id_0,
    input  tri1 id_1,
    input  tri0 id_2,
    input  tri0 id_3
);
  logic id_5 = id_2;
  assign module_1.id_6 = 0;
endmodule
module module_0 #(
    parameter id_5 = 32'd23
) (
    output supply1 id_0,
    input uwire id_1,
    input wor id_2,
    output wor id_3,
    output tri1 id_4,
    input wor _id_5,
    input tri1 module_1,
    output wor id_7,
    input supply0 id_8,
    output tri id_9,
    input tri0 id_10,
    output logic id_11,
    output tri0 id_12,
    output tri1 id_13,
    input supply1 id_14
);
  always @(posedge id_10) begin : LABEL_0
    if (!1) id_11 <= id_2;
  end
  assign id_3 = id_5;
  module_0 modCall_1 (
      id_0,
      id_10,
      id_8,
      id_14
  );
  logic id_16 = id_2 == id_10;
  wire id_17;
  wire [-1 : id_5] id_18;
  assign id_9  = id_17 ? 1 : id_16;
  assign id_13 = id_2;
endmodule
