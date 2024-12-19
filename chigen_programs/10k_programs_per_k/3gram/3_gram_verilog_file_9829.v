// Seed: 1378049445
module module_0;
  always @(posedge id_1) begin : LABEL_0
    id_1 <= 1;
  end
  wire id_2;
  module_2 modCall_1 ();
  wire id_3;
  wire id_4;
endmodule
module module_1;
  wire id_2;
  module_0 modCall_1 ();
endmodule
module module_2;
  tri id_1;
  assign id_1 = id_1 - 1'b0;
  wire id_2;
  assign module_0.id_1 = 0;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_5[1'd0] = id_6;
  final $display();
  or primCall (id_1, id_2, id_3, id_4, id_5, id_6);
  module_2 modCall_1 ();
endmodule
