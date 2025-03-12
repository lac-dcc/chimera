// Seed: 1751303410
module module_0 ();
  wire id_1;
  logic [7:0][1] id_2;
endmodule
module module_1 (
    output tri0 id_0
);
  localparam id_2 = 1;
  module_0 modCall_1 ();
  assign id_0 = 1;
endmodule
module module_2 #(
    parameter id_3 = 32'd82
) (
    id_1,
    id_2,
    _id_3
);
  input wire _id_3;
  and primCall (id_1, id_2, id_4, id_5, id_6);
  inout reg id_2;
  output reg id_1;
  assign id_1 = id_3;
  parameter id_4 = 1;
  wire id_5;
  for (id_6 = 1; 1'b0; id_2 = 1) begin : LABEL_0
    assign id_2 = id_3;
    wire [1 : id_3] id_7;
    wire id_8;
  end
  always
  fork
    id_6 = id_2;
    id_1 <= id_6;
  join_none
  module_0 modCall_1 ();
endmodule
