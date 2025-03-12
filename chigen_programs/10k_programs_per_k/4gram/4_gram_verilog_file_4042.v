// Seed: 2119118291
module module_0;
  real id_1;
  ;
endmodule
module module_1 (
    input  wire id_0,
    output wire id_1
);
  assign id_1 = -1;
  assign id_1 = id_0 * 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0.0;
endmodule
module module_2 #(
    parameter id_4 = 32'd34,
    parameter id_5 = 32'd39,
    parameter id_7 = 32'd34
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    id_6,
    _id_7
);
  input wire _id_7;
  inout logic [7:0] id_6;
  input wire _id_5;
  input wire _id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  output supply0 id_1;
  reg [id_4 : 1] id_8;
  assign id_1 = -1 + id_5 == -1;
  module_0 modCall_1 ();
  assign modCall_1.id_1  = 0.0;
  assign id_2[id_4-id_5] = id_8;
  always
    case (1)
      -1'h0:   id_8 <= 1;
      default: id_6[1'b0-:id_7] = id_4;
    endcase
  parameter id_9 = 1;
endmodule
