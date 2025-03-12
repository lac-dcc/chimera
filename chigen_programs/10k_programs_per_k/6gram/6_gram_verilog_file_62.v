// Seed: 3370030521
module module_0 (
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
    id_13
);
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_14;
  logic [1 : 1] id_15;
endmodule
module module_1 #(
    parameter id_2 = 32'd3
) (
    id_1,
    _id_2
);
  input wire _id_2;
  inout wire id_1;
  logic [id_2 : 1] id_3[1 : 1  !=?  1];
  logic [7:0][-1 : id_2] id_4;
  assign id_3 = id_4[1'h0 :-1'b0];
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1
  );
  supply0 id_5;
  assign id_4[id_2&-1'd0] = -1'd0;
  logic id_6;
  ;
  assign id_5 = -1'b0;
endmodule
