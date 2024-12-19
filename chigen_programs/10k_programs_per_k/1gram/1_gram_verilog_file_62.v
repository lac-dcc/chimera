// Seed: 2238250280
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  for (id_5 = 1; 1'b0; id_1 = 1) begin : LABEL_0
    wire id_6;
  end
  wor id_7, id_8;
  assign id_2 = id_8;
  assign module_1.id_7 = 0;
  always_latch @(1 or id_7) if (~1) id_4 = 1;
  wire id_9;
endmodule
module module_1 #(
    parameter id_7 = 32'd20,
    parameter id_8 = 32'd33,
    parameter id_9 = 32'd87
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  defparam id_7 = 1, id_8 = 1, id_9 = id_7;
  wire id_10;
  module_0 modCall_1 (
      id_10,
      id_1,
      id_10,
      id_10
  );
  wire id_11, id_12, id_13, id_14;
endmodule
