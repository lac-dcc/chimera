// Seed: 3261931522
module module_0 ();
  initial begin : LABEL_0
    id_1 <= 1;
  end
  assign module_3.type_8 = 0;
  assign module_1.id_1   = 0;
endmodule
module module_1 (
    output uwire   id_0,
    output supply0 id_1
);
  module_0 modCall_1 ();
  assign id_1 = 1;
  assign id_0 = 1;
endmodule
module module_2 (
    input uwire id_0,
    output wor id_1,
    input supply1 id_2,
    output supply1 id_3,
    output wor id_4
);
  logic [7:0] id_6;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_7;
  assign id_6[1'b0] = 1'b0 ^ 1;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  uwire   id_5;
  supply0 id_6 = id_2 + id_5;
  always @(negedge ((1) !== (1))) $display;
  always @(posedge id_6 == 1 or posedge id_5) begin : LABEL_0
    assert (1'b0);
  end
  module_0 modCall_1 ();
endmodule
