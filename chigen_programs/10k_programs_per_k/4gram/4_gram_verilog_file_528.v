// Seed: 2570198326
module module_0 #(
    parameter id_9 = 32'd67
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input logic [7:0] id_6;
  output logic [7:0] id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  localparam id_8 = 1, id_9 = id_8, id_10 = id_6[1 :-1];
  assign id_5[id_9] = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout logic [7:0] id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_3,
      id_3,
      id_2
  );
  output wire id_1;
  wire id_4;
  assign id_2 = id_3[-1 : 1];
  assign id_3 = id_2;
  wire id_5;
endmodule
