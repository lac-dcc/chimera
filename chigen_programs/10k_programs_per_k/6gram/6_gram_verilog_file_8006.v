// Seed: 2691137123
module module_0 ();
  wire id_1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(negedge id_6 == 1) begin : LABEL_0
    if (1) $display(1'b0, "", 1);
    id_1 <= id_7;
    id_5 <= id_6;
  end
  or primCall (id_1, id_5, id_6, id_7);
  module_0 modCall_1 ();
endmodule
