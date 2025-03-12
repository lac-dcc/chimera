// Seed: 1669367726
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input wand id_2
);
  assign id_1 = 1;
  assign module_1.id_11 = 0;
endmodule
module module_1 #(
    parameter id_7 = 32'd12
) (
    output tri1 id_0,
    input tri1 id_1,
    output supply1 id_2,
    output uwire id_3,
    input tri1 id_4,
    input supply1 id_5,
    output tri1 id_6,
    input tri _id_7,
    input supply0 id_8
);
  assign id_6 = 1;
  module_0 modCall_1 (
      id_8,
      id_0,
      id_5
  );
  logic [7:0] id_10;
  always @(1 or id_10[id_7] == -1'b0) begin : LABEL_0
    disable id_11;
  end
endmodule
