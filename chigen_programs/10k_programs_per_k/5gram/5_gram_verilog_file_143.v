// Seed: 2263048078
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  assign module_1.id_4 = 0;
  tri0 id_8;
  assign id_8 = 1'h0;
  always_comb @(1) id_8 = id_3;
  wire id_9 = 1;
  wire id_10;
  wire id_11;
  wire id_12;
  wire id_13;
endmodule
module module_1 #(
    parameter id_4 = 32'd18,
    parameter id_5 = 32'd28,
    parameter id_6 = 32'd43,
    parameter id_7 = 32'd11,
    parameter id_8 = 32'd28,
    parameter id_9 = 32'd29
) (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3;
  defparam id_4.id_5 = 1, id_6.id_7 = 1, id_8.id_9 = 1;
  always #0 begin : LABEL_0
    id_1[1] <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2
  );
endmodule
