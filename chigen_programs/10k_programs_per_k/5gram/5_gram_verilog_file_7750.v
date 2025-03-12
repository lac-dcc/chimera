// Seed: 3545191879
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd30,
    parameter id_3 = 32'd63
) (
    _id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output uwire id_4;
  inout wire _id_3;
  inout wire id_2;
  inout wire _id_1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4
  );
  wire [id_3  -  1 : id_1] id_6;
endmodule
module module_0 #(
    parameter id_1  = 32'd0,
    parameter id_14 = 32'd53,
    parameter id_2  = 32'd97
) (
    module_2,
    _id_2,
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
    id_13,
    _id_14
);
  input wire _id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  output logic [7:0] id_5;
  output wire id_4;
  input wire id_3;
  output wire _id_2;
  input wire _id_1;
  logic id_15[id_2 : id_1];
  module_0 modCall_1 (
      id_8,
      id_11,
      id_9
  );
  assign id_5[-1] = id_15[id_14];
endmodule
