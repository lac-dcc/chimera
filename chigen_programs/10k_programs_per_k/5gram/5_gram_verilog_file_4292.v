// Seed: 3733151079
module module_0 ();
  assign id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_6 ? 1'b0 : id_6 ? 1 == id_5 | 1 < 1 : 1'b0;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_7;
  reg  id_8;
  id_9 :
  assert property (@(posedge 1) id_6)
  else $display(1, id_8);
  always
    while (1) begin : LABEL_0
      id_2 <= id_8;
    end
  assign id_8 = 1;
endmodule
