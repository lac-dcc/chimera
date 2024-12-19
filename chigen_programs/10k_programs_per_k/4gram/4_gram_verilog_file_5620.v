// Seed: 2464011304
module module_0 ();
  logic [7:0] id_1, id_2;
  generate
    assign id_1 = id_1[1];
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  always @(posedge (id_5) or posedge (1)) begin : LABEL_0
    id_1 = id_6;
  end
  module_0 modCall_1 ();
endmodule
