// Seed: 1800036451
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
    id_10
);
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_11;
  always @(1 * id_5) begin : LABEL_0
    disable id_12;
  end
endmodule
module module_1 #(
    parameter id_5 = 32'd21,
    parameter id_6 = 32'd70
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1
  );
  defparam id_5.id_6 = 1;
  assign id_2 = id_4;
endmodule
