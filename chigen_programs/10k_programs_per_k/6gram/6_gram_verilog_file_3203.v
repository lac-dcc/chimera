// Seed: 4112948973
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
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd94,
    parameter id_7 = 32'd17
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire _id_7;
  output wire id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_5,
      id_1,
      id_1,
      id_5
  );
  inout logic [7:0] id_4;
  inout wire _id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4[id_7==1 : {id_3{-1}}] = id_4 ? 1'b0 : -1'h0;
  logic id_11;
  ;
  assign id_3 = id_5;
endmodule
