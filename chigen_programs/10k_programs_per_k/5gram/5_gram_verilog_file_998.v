// Seed: 3480920410
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    output uwire id_2
);
  reg id_4;
  wor id_5 = -1;
  assign id_4 = id_0;
  if (1)
    always @(posedge id_0 != id_4 or posedge id_4) begin : LABEL_0
      id_4 <= id_5;
    end
  wire [-1 : 1] id_6;
endmodule
module module_1 #(
    parameter id_7 = 32'd20
) (
    input  tri  id_0
    , id_10,
    output tri1 id_1,
    output wire id_2,
    output wire id_3,
    output tri  id_4,
    output tri1 id_5,
    input  tri0 id_6,
    input  tri0 _id_7,
    output tri  id_8
);
  logic [1 : id_7] id_11;
  ;
  module_0 modCall_1 (
      id_6,
      id_4,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
