// Seed: 1574113862
module module_0 (
    output tri0 id_0,
    input  tri0 id_1
);
endmodule
module module_1 #(
    parameter id_0 = 32'd86,
    parameter id_2 = 32'd29,
    parameter id_5 = 32'd63
) (
    input supply1 _id_0,
    output tri1 id_1,
    output tri _id_2,
    output supply0 id_3,
    output supply1 id_4,
    output uwire _id_5,
    input tri id_6
);
  logic [id_5 : id_2] id_8 = id_8[id_0*id_0];
  assign id_8 = id_6;
  wire id_9;
  reg  id_10;
  assign id_4 = -1'd0;
  assign id_1 = id_10;
  assign id_9 = id_0.product;
  always_ff begin : LABEL_0
    id_10 <= ~id_8;
  end
  wire id_11;
  ;
  module_0 modCall_1 (
      id_1,
      id_6
  );
  assign modCall_1.id_0 = 0;
  assign id_3 = {id_9 == -1'h0, 1'b0 - id_0, 1, 1};
  logic id_12 = id_12;
  logic id_13;
  ;
  xor primCall (id_1, id_8, id_11, id_9, id_10);
  wire [-1 : -1] id_14;
endmodule
