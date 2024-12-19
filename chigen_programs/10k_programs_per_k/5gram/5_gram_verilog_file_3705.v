// Seed: 1228709045
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
endmodule
module module_1 #(
    parameter id_13 = 32'd84,
    parameter id_14 = 32'd17
) (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_4, id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12;
  always @(id_8) begin : LABEL_0
    id_2 <= 1;
  end
  assign id_7 = id_9;
  module_0 modCall_1 (
      id_12,
      id_7,
      id_10,
      id_9,
      id_7,
      id_10
  );
  defparam id_13.id_14 = 1;
endmodule
