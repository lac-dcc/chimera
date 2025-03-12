// Seed: 1687386004
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
    id_11
);
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_12;
endmodule
module module_1 #(
    parameter id_3 = 32'd3
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire _id_3;
  input wire id_2;
  input wire id_1;
  logic [id_3 : 1] id_9;
  ;
  logic id_10;
  and primCall (id_6, id_8, id_4, id_2, id_1);
  generate
    assign id_10 = 1;
  endgenerate
  module_0 modCall_1 (
      id_4,
      id_10,
      id_10,
      id_9,
      id_6,
      id_6,
      id_6,
      id_10,
      id_6,
      id_2,
      id_9
  );
endmodule
