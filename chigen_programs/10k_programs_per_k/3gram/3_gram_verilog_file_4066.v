// Seed: 1956531076
module module_0;
  bit id_1;
  final begin : LABEL_0
    #1;
    id_1 = 1'b0;
    id_1 <= -1;
    $signed(8);
    ;
  end
  assign module_1.id_0 = 0;
  always_ff begin : LABEL_1
    id_1 <= id_1;
  end
endmodule
module module_1 #(
    parameter id_0 = 32'd95,
    parameter id_1 = 32'd77
) (
    input tri0 _id_0,
    input supply1 _id_1,
    input supply1 id_2
);
  localparam [id_0 : id_1] id_4 = -1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output wire id_0,
    input supply0 id_1,
    input wire id_2,
    output tri id_3,
    input wor id_4,
    input supply0 id_5
);
  nand primCall (id_0, id_1, id_2, id_4, id_5);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
