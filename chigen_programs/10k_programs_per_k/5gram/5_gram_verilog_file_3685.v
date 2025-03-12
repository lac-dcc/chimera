// Seed: 3204494165
module module_0 (
    id_1,
    id_2,
    id_3
);
  output uwire id_3;
  input wire id_2;
  output wire id_1;
  logic [-1 : 1] id_4;
  assign id_3 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4
  );
  assign id_4 = id_3;
endmodule
module module_2 #(
    parameter id_2 = 32'd20
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout logic [7:0] id_4;
  input logic [7:0] id_3;
  inout wire _id_2;
  inout wire id_1;
  assign id_4[""&1] = id_4#(
      .id_3(1'b0),
      .id_4(-1),
      .id_1(1 + 1)
  );
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
  logic [-1 : 1] id_6;
  ;
  logic id_7 = id_3;
  wire  id_8;
  ;
  assign id_7 = id_3[-1'b0 : id_2];
endmodule
