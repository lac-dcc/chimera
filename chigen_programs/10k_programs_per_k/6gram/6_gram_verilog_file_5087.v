// Seed: 377425345
module module_0;
  wire  id_1;
  wire  id_2;
  wire  id_3;
  logic id_4;
  ;
endmodule
module module_1 (
    input  wire  id_0,
    output logic id_1,
    output logic id_2
);
  always @(id_0 or -1'b0) begin : LABEL_0
    id_2 <= -1 == "";
    id_2 = id_0;
    id_1 <= -1'b0;
  end
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_4 = 32'd5
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  input wire id_5;
  input wire _id_4;
  input wire id_3;
  module_0 modCall_1 ();
  output tri0 id_2;
  inout logic [7:0] id_1;
  assign id_2#(1)   = 1;
  assign id_1[id_4] = -1;
endmodule
