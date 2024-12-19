// Seed: 104608843
module module_0 (
    id_1,
    id_2,
    .id_6(id_3),
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign module_1.id_3 = 0;
endmodule
module module_1 #(
    parameter id_11 = 32'd63,
    parameter id_12 = 32'd55
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_9,
      id_1,
      id_9,
      id_6
  );
  if (1) begin : LABEL_0
    genvar id_10;
    defparam id_11.id_12 = id_8;
    assign id_9  = 1 - 1;
    assign id_11 = id_3;
  end
endmodule
