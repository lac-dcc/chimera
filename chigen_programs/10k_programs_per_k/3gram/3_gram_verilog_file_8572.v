// Seed: 955841007
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
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_13 = id_3;
  wire [1 'b0 : -1] id_14 = id_9;
endmodule
module module_1 #(
    parameter id_2 = 32'd79,
    parameter id_3 = 32'd91
) (
    id_1,
    _id_2,
    _id_3,
    id_4
);
  output logic [7:0] id_4;
  input wire _id_3;
  input wire _id_2;
  output wire id_1;
  wire [id_2 : 1] id_5;
  uwire id_6;
  ;
  logic [7:0] id_7;
  assign id_4[id_2*-1] = -1'b0;
  assign id_7 = id_3;
  assign id_1 = id_6;
  assign id_4[id_2] = id_6 + (id_3);
  module_0 modCall_1 (
      id_6,
      id_6,
      id_5,
      id_6,
      id_6,
      id_6,
      id_5,
      id_1,
      id_6,
      id_5,
      id_5,
      id_5
  );
  assign id_6 = id_7[id_3] * id_3 + {id_7 + -1, id_6} - id_5 < id_7;
  logic [-1 : 1] id_8;
  ;
  wire [1 'b0 : ""] id_9;
  genvar id_10;
  wire id_11;
endmodule
