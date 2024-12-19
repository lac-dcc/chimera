// Seed: 2690491956
module module_0 ();
  assign id_1[1 : 1] = 1'b0;
  generate
    supply0 id_2 = 1;
  endgenerate
  assign module_2.type_0 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  always @(negedge id_3) if (1) id_2 <= !id_1;
  assign id_2 = id_3;
endmodule
module module_2 (
    input logic id_0,
    input tri0  id_1
);
  logic id_3;
  always_ff @(1 or(1)) begin : LABEL_0
    id_3 = id_0;
    if (1) id_3 <= #id_3 1;
  end
  wire id_4;
  module_0 modCall_1 ();
  assign id_3 = 1;
endmodule
