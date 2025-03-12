// Seed: 896006627
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
    id_12
);
  output logic [7:0] id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_12[1] = -1 ? id_6 ^ 1 : 1;
  assign id_2 = id_5;
  logic [-1 : -1 'd0] id_13;
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd54
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire _id_3;
  output wire id_2;
  output wire id_1;
  logic [7:0] id_7;
  assign id_2 = id_6;
  assign id_7[id_3] = !id_4;
  logic id_8;
  ;
  supply0 id_9 = {-1'b0, id_4} == 1;
  module_0 modCall_1 (
      id_4,
      id_8,
      id_6,
      id_4,
      id_8,
      id_6,
      id_9,
      id_8,
      id_8,
      id_8,
      id_6,
      id_7
  );
endmodule
