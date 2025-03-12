// Seed: 1163803144
module module_0 #(
    parameter id_3 = 32'd63,
    parameter id_9 = 32'd26
) (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wire _id_3;
  wire id_4;
  ;
  logic id_5;
  ;
  wire id_6, id_7, id_8, _id_9, id_10, id_11;
  struct packed {logic [1 : id_3] id_12;} id_13;
  ;
  logic id_14;
  wire [-1 : id_9] id_15;
  reg id_16;
  assign id_11 = 1;
  wire id_17;
  logic [1 : 1] id_18;
  always #1 begin : LABEL_0
    id_16 <= -1;
  end
  logic id_19 = -1;
endmodule
module module_1 #(
    parameter id_1 = 32'd54
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output logic [7:0] id_5;
  inout logic [7:0] id_4;
  inout wire id_3;
  input wire id_2;
  inout wire _id_1;
  module_0 modCall_1 (
      id_3,
      id_3
  );
  reg  id_6;
  real id_7;
  assign id_5[id_1] = id_1;
  logic id_8;
  assign id_4[1] = -1;
  logic [-1 : 1] id_9;
  ;
  initial id_6 = id_3;
endmodule
