// Seed: 3481953785
module module_0 (
    output wor id_0,
    input wire id_1,
    input wand id_2,
    input supply0 id_3
);
endmodule
module module_1 #(
    parameter id_11 = 32'd42
) (
    output tri0 id_0,
    input supply0 id_1,
    output supply1 id_2,
    output tri0 id_3,
    input tri0 id_4,
    input supply1 id_5,
    output logic id_6,
    output wire id_7,
    input wire id_8,
    output wor id_9
);
  parameter id_11 = 1;
  module_0 modCall_1 (
      id_2,
      id_8,
      id_1,
      id_8
  );
  assign modCall_1.id_1 = 0;
  logic id_12[1 : ~&  1 'b0];
  logic [7:0] id_13;
  ;
  always @(*) begin : LABEL_0
    if (id_11) id_6 <= id_11;
  end
  assign id_12 = id_13[id_11] ? -1 : -1;
endmodule
