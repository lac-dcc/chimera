// Seed: 2259298280
module module_0 ();
  assign id_1[1] = 1;
endmodule
module module_1 ();
  wire id_2, id_3;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge 1 or 1) begin : LABEL_0
    #1 id_4 <= id_5;
    id_1 <= 1;
    {1 == 1'b0, 1} <= id_3;
  end
  module_0 modCall_1 ();
  wire id_6;
  nand primCall (id_1, id_2, id_3, id_4, id_5);
endmodule
