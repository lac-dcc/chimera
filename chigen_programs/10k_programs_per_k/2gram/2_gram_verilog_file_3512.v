// Seed: 1487508999
module module_0;
  wire id_1;
  assign module_2.type_0 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3 = id_5;
  assign id_2 = id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
  always @(posedge id_5) begin : LABEL_0
    id_1 <= 1;
  end
endmodule
module module_2 (
    input  wire id_0,
    output wand id_1,
    output wand id_2,
    input  wire id_3,
    output tri  id_4
);
  wire id_6;
  module_0 modCall_1 ();
endmodule
