// Seed: 231978328
module module_0;
  assign id_1 = &1;
  wire id_2;
  wire id_3, id_4, id_5;
endmodule
module module_1;
  reg id_2 = id_1;
  module_0 modCall_1 ();
  id_3 :
  assert property (@(posedge -1) id_1)
    @(posedge -1) begin : LABEL_0
      id_1 <= -1'b0;
    end
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  supply0 id_6;
  parameter id_7 = id_1;
  wire id_8;
  initial id_1 = id_6;
  module_0 modCall_1 ();
endmodule
