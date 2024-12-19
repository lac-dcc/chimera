// Seed: 1496171248
module module_0;
  assign id_1 = 1'b0;
  assign module_2.type_0 = 0;
  always @(id_1 or posedge 1) begin : LABEL_0
    id_1 <= 1;
  end
  assign id_1 = id_1 & 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  tri id_4 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input  tri0 id_0,
    output tri  id_1,
    input  tri0 id_2,
    output wor  id_3
);
  always repeat (id_2[1^1'b0==1]) #1;
  module_0 modCall_1 ();
endmodule
