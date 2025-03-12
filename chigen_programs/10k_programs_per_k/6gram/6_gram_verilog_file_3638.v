// Seed: 3700110427
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    output wand id_2,
    output supply1 id_3
);
  supply0 id_5 = -1'b0;
  always @(posedge id_1) force id_2 = 1'd0;
endmodule
module module_0 #(
    parameter id_1 = 32'd21
) (
    input supply0 id_0,
    input supply1 _id_1,
    input tri0 id_2,
    input supply1 id_3,
    output logic id_4,
    input tri0 id_5,
    input tri0 id_6,
    input tri1 id_7,
    output tri0 id_8
);
  tri  id_10;
  wire id_11;
  always @(id_11 or -1) begin : LABEL_0
    id_4 <= id_1#(.id_3(-1));
  end
  nand primCall (id_4, id_2, id_6, id_3, id_13, id_12, id_10, id_5, id_7, id_11, id_14, id_0);
  tri [module_1 : id_1] id_12;
  wire id_13;
  assign id_12 = 1;
  wire id_14;
  assign id_12 = id_5;
  assign id_10 = 1'h0;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_8,
      id_8
  );
  assign modCall_1.id_1 = 0;
endmodule
