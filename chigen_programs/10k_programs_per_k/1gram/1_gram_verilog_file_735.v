// Seed: 835364945
module module_0;
endmodule
module module_1 (
    output uwire id_0,
    input tri id_1,
    output supply1 id_2,
    input uwire id_3,
    input wor id_4,
    output uwire id_5,
    input wor id_6,
    output tri id_7,
    input tri id_8
);
  always_ff begin : LABEL_0
    id_0 += id_4;
    struct packed {
      logic id_10;
      logic id_11;
    } id_12;
  end
  module_0 modCall_1 ();
  wire id_13;
endmodule
module module_2 #(
    parameter id_9 = 32'd16
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9[id_9 : 1]
);
  input logic [7:0] _id_9;
  output wire id_8;
  output reg id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  wire id_10;
  ;
  wire id_11;
  ;
  initial id_7 <= $signed(18);
  ;
  tri1 id_12, id_13;
  assign id_12 = ~1'b0 ** 1;
  wire id_14, id_15;
endmodule
