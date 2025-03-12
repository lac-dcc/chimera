// Seed: 3553525838
module module_0 #(
    parameter id_8 = 32'd21
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14["" : id_8]
);
  output logic [7:0] id_14;
  input wire id_13;
  assign module_1.id_3 = 0;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire _id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_15 = -1;
  parameter id_16 = (1);
endmodule
module module_1 #(
    parameter id_1 = 32'd26,
    parameter id_4 = 32'd63
) (
    _id_1,
    id_2[1'b0 : id_1|1]
);
  output logic [7:0] id_2;
  output wire _id_1;
  logic [1 'b0 : 1] id_3 = id_3 ? 1'b0 : id_3 && id_3;
  localparam [(  1  ) : -1] id_4 = 1;
  wire id_5, id_6[1  +  ~  id_4 : -1];
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_3,
      id_5,
      id_4,
      id_5,
      id_6,
      id_6,
      id_3,
      id_5,
      id_2
  );
  assign id_3 = -1;
endmodule
