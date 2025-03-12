// Seed: 36463971
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_7[1 : 1 'd0 <  -1];
  assign id_7 = id_3 ? {id_2, !id_7} : id_7;
  assign id_6 = -1'b0;
  wire [1 : 1] id_8;
endmodule
module module_1 #(
    parameter id_2 = 32'd90
) (
    id_1,
    _id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire _id_2;
  inout wire id_1;
  wire [$realtime : id_2] id_5;
  initial assume (id_2);
  module_0 modCall_1 (
      id_5,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5
  );
endmodule
