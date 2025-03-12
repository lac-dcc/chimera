// Seed: 1853025723
module module_0;
  wire id_1;
  module_2 modCall_1 ();
  always @(id_1 or negedge -1) begin : LABEL_0
    wait (1 == id_1);
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output logic [7:0] id_3;
  input wire id_2;
  input wire id_1;
  always_latch @(id_2 or posedge -1 !=? id_2) begin : LABEL_0
    id_3[1] = id_1;
  end
  module_0 modCall_1 ();
  parameter id_4 = 1;
  logic \id_5 = 1;
endmodule
module module_2;
  wire id_1;
  ;
  wire id_2;
  assign id_1 = id_1;
  wire id_3;
endmodule
