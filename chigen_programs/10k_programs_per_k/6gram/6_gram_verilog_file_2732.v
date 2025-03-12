// Seed: 4055274841
module module_0;
  logic id_1;
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output logic [7:0] id_4;
  inout wire id_3;
  module_0 modCall_1 ();
  output logic [7:0] id_2;
  input wire id_1;
  nor primCall (id_2, id_3, id_5);
  wire [1 : -1] id_6;
  assign id_2[1] = id_5;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  module_0 modCall_1 ();
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout reg id_2;
  output wire id_1;
  parameter integer id_7 = ~1;
  logic id_8;
  ;
  assign id_2 = ~&id_5;
  reg id_9;
  initial $signed(20);
  ;
  always @(negedge -1) begin : LABEL_0
    id_9 <= id_2;
    id_2 <= 1'b0;
    id_8 <= 1'b0;
  end
endmodule
