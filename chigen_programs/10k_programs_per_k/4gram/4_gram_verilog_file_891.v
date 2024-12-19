// Seed: 3007076588
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  integer id_5 = 1'h0;
  assign module_1.type_0 = 0;
  id_6 :
  assert property (@(posedge id_5 - 1) 1)
  else $display(1);
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1
);
  always @(1) begin : LABEL_0
    disable id_3;
  end
  initial id_0 = 1;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3
  );
endmodule
