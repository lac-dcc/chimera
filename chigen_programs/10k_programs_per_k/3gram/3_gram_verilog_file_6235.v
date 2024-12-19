// Seed: 1013329834
module module_0;
  always @(posedge id_1 or posedge 1);
  assign module_2.type_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input  tri1 id_0,
    output tri0 id_1
);
  logic [7:0] id_3;
  reg id_5;
  always id_5 = #1 1;
  module_0 modCall_1 ();
endmodule
module module_3 (
    output logic id_0,
    output wire  id_1
);
  initial begin : LABEL_0
    id_1 = 1;
    id_0 = id_3;
    id_3 <= 1;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
