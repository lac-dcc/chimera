// Seed: 3889956403
module module_0 (
    id_1
);
  inout wire id_1;
  wire id_2;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge 1) begin : LABEL_0
    force id_4 = id_2;
  end
  wire id_5;
  module_0 modCall_1 (id_4);
endmodule
module module_2 #(
    parameter id_2 = 32'd18
) (
    output tri1  id_0,
    output wand  id_1,
    input  uwire _id_2
);
  localparam id_4 = -1, id_5 = 1, id_6 = id_5;
  logic [7:0] id_7;
  assign id_1 = id_7[id_2 :-1];
  module_0 modCall_1 (id_4);
  assign id_1 = -1;
endmodule
