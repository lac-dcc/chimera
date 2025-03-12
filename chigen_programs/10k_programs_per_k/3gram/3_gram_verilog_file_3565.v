// Seed: 1884070224
module module_0;
  wire id_1, id_2, id_3, id_4, id_5, id_6;
  assign module_2.id_2 = 0;
endmodule
module module_1;
  logic id_1;
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_2 = 32'd8
) ();
  uwire id_1 = -1;
  wire  _id_2;
  module_0 modCall_1 ();
  assign id_1 = -1;
  wire id_3;
  logic [(  1  ) : id_2] id_4 = id_2;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  or primCall (id_1, id_10, id_11, id_14, id_2, id_3, id_4, id_8, id_9);
  output wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  module_0 modCall_1 ();
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output reg id_1;
  logic [-1 : 1 'b0] id_15;
  always @(posedge ('b0)) begin : LABEL_0
    id_1 <= (id_14);
  end
endmodule
