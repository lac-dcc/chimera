// Seed: 3593622828
module module_0 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  xnor primCall (id_1, id_2, id_3, id_7, id_8, id_9);
  inout logic [7:0] id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  assign id_8[1] = id_7;
endmodule
module module_2 (
    id_1,
    id_2
);
  output reg id_2;
  input wire id_1;
  always @(*) begin : LABEL_0
    id_2 <= -1;
  end
  module_0 modCall_1 ();
endmodule
