// Seed: 2193355233
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  integer id_7, id_8;
  generate
    parameter id_9 = -1;
  endgenerate
endmodule
module module_1 #(
    parameter id_0 = 32'd60,
    parameter id_3 = 32'd1
) (
    input supply0 _id_0,
    input tri id_1,
    input tri id_2,
    input supply0 _id_3
);
  wire [-1 : id_3] id_5;
  logic id_6;
  ;
  logic id_7;
  ;
  bit   id_8 = -1'b0;
  logic id_9;
  assign id_5 = id_6;
  id_10 :
  assert property (@(posedge id_9 * 1) id_9) id_8 = id_5;
  assign id_7 = id_2;
  assign id_7 = id_9;
  wire ["" : id_0] id_11;
  module_0 modCall_1 (
      id_5,
      id_10,
      id_10,
      id_9,
      id_6,
      id_6
  );
  assign id_6 = id_9;
  wire id_12, id_13, id_14;
  assign id_13 = id_10;
  assign id_10 = id_3;
endmodule
