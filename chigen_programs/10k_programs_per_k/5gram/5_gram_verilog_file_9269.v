// Seed: 113974049
module module_0 #(
    parameter id_5 = 32'd72
) (
    input tri   id_0,
    input uwire id_1,
    input uwire id_2
);
  logic [1 : 1 'b0] id_4;
  parameter id_5 = 1;
  assign id_4[id_5] = id_2;
  logic [7:0] id_6;
  final $signed(id_5);
  ;
  always @(id_2) {id_1, id_6[-1'd0]} <= ~id_6;
endmodule
module module_1 (
    input  wire  id_0,
    input  uwire id_1,
    input  wire  id_2,
    output tri0  id_3,
    output tri0  id_4
);
  assign id_3 = 1 ? id_0 : -1;
  assign id_3 = id_1 < id_2;
  wire [-1 'h0 : 1] id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2
  );
  logic id_7;
  ;
  wire id_8;
endmodule
