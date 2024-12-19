// Seed: 2415925718
module module_0;
  wire id_1;
  tri  id_2 = 1;
endmodule
module module_1 ();
  assign id_1 = 1;
  uwire id_2;
  reg id_3, id_4;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  wire id_5;
  wire id_6;
  assign id_4 = 1;
  assign id_2 = 1;
  always @(posedge id_4) begin : LABEL_0
    id_3 <= #1 id_1 != id_6;
    id_1 <= id_4;
  end
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  always @(posedge id_2) begin : LABEL_0
    id_1 = 1'b0;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
