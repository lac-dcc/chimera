// Seed: 762297536
module module_0;
  wire id_1;
  assign module_2.id_7 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_4 = id_2, id_5;
  assign id_2 = 1'b0;
  wire id_6;
  always @(1 or posedge 1) begin : LABEL_0
    id_5 <= 1;
  end
  id_7 :
  assert property (@(negedge 1) 1)
  else id_4 <= 0 ^ id_7;
  module_0 modCall_1 ();
endmodule
