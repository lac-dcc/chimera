// Seed: 57402440
module module_0 #(
    parameter id_14 = 32'd36,
    parameter id_15 = 32'd8
) (
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
    id_11
);
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_6;
  tri0 id_12;
  assign id_2  = id_6;
  assign id_12 = id_10 - 1;
  for (id_13 = id_4; 1'b0; id_5 = id_10) begin : LABEL_0
    defparam id_14.id_15 = 1;
  end
  tri  id_16 = id_10;
  wire id_17;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_1,
      id_1,
      id_5,
      id_6,
      id_6,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_12 = 0;
endmodule
