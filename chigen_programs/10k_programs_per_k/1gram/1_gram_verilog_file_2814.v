// Seed: 1813273127
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_15;
  wand id_16;
  assign id_16 = 1;
endmodule
macromodule module_1 #(
    parameter id_4 = 32'd26,
    parameter id_5 = 32'd32,
    parameter id_6 = 32'd61
) (
    output wire id_0
);
  always @(posedge id_2) $display(1);
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  defparam id_4 = id_4, id_5 = id_4, id_6 = 1 + 1'b0;
endmodule
