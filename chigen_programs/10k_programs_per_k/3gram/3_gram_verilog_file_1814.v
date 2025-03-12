// Seed: 477438198
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  parameter id_7 = -1'b0;
  always @(negedge -1 or negedge -1);
endmodule
module module_2 #(
    parameter id_1  = 32'd31,
    parameter id_13 = 32'd69,
    parameter id_4  = 32'd28,
    parameter id_6  = 32'd41,
    parameter id_9  = 32'd46
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    _id_9
);
  input wire _id_9;
  output wire id_8;
  inout wire id_7;
  input wire _id_6;
  output wire id_5;
  inout wire _id_4;
  input wire id_3;
  inout wire id_2;
  input wire _id_1;
  logic id_10;
  ;
  logic [7:0][id_6 : id_4] id_11;
  tri id_12;
  module_0 modCall_1 (
      id_12,
      id_5
  );
  assign id_11[id_1] = id_12;
  assign id_12 = id_4 & id_2;
  parameter id_13 = -1;
  assign id_11[-1 : id_9] = id_7;
  wire id_14;
  defparam id_13.id_13 = id_13;
endmodule
