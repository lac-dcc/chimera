// Seed: 511722056
module module_0 #(
    parameter id_4 = 32'd50
) (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  defparam id_4 = 1'h0;
  parameter id_5 = 1;
  wire id_6;
  localparam id_7 = id_4;
  wire id_8, id_9, id_10;
  parameter id_11 = id_4;
  wire id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2
  );
  assign id_2 = -1;
  wire id_4;
  not primCall (id_2, id_1);
  wire id_5;
  assign id_3 = -1 & 1;
endprogram
