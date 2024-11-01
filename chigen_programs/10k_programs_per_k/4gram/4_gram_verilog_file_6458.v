// Seed: 2296827107
module module_0;
  wire id_1 = 1'b0 & 1 + 1;
  wand id_2 = id_1;
endmodule
module module_1 (
    output supply0 id_0,
    input tri1 id_1,
    input wand id_2,
    output wire id_3,
    input logic id_4
);
  logic id_6;
  always @(*) id_6 <= id_4;
  module_0();
  assign id_6 = id_4;
endmodule
module module_2 (
    output wand  id_0,
    input  uwire id_1
);
  specify
    (posedge id_3 => (id_4 +: 1'b0)) = (1, id_1);
  endspecify module_0();
endmodule
