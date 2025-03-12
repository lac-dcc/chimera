// Seed: 1581528521
module module_0 (
    id_1[1&-1 :-1],
    id_2,
    id_3
);
  inout tri0 id_3;
  input wire id_2;
  input logic [7:0] id_1;
  assign id_3 = -1;
  logic [7:0] id_4, id_5, id_6;
  uwire id_7, id_8, id_9;
  assign id_7 = 1'b0;
  generate
    logic id_10;
  endgenerate
  wire [-1 : 1] id_11, id_12;
  assign id_3 = id_5[1];
  assign module_1.id_1 = 0;
  logic id_13;
  ;
  wire id_14, id_15;
endmodule
module module_1 #(
    parameter id_1 = 32'd79
) (
    _id_1
);
  inout wire _id_1;
  wire [id_1 : -1] id_2;
  logic id_3;
  ;
  logic id_4;
  ;
  logic id_5;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_5
  );
  assign id_1 = id_5;
  assign id_4 = id_3[id_1 :-1][-1];
endmodule
