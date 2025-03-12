// Seed: 3566133979
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input logic [7:0] id_5;
  input wire id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3[""] = "" ? 1'h0 : id_5[-1 : 1'b0];
  wire id_9;
endmodule
module module_1 #(
    parameter id_5 = 32'd78
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire _id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  wire id_8;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_1,
      id_3,
      id_1,
      id_4,
      id_7,
      id_7
  );
  assign id_1[id_5] = 1'h0;
  wire id_9;
  ;
endmodule
