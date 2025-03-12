// Seed: 3580808686
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_8;
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd60,
    parameter id_8 = 32'd63
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout logic [7:0] id_4;
  input wire _id_3;
  output wire id_2;
  output wire id_1;
  parameter id_6 = -1;
  wire id_7;
  module_0 modCall_1 (
      id_6,
      id_1,
      id_7,
      id_2,
      id_1,
      id_7,
      id_6
  );
  wire [1 : 1] _id_8;
  logic id_9;
  ;
  assign id_4[id_3 : id_8] = !id_7;
endmodule
