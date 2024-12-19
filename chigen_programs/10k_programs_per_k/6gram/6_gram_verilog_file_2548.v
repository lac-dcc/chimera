// Seed: 609612017
module module_0 #(
    parameter id_5 = 32'd55,
    parameter id_6 = 32'd4
) (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  tri0 id_3, id_4;
  assign id_4 = id_3;
  defparam id_5.id_6 = id_4;
endmodule
module module_1 (
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
    id_12
);
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_13, id_14;
  assign id_10 = 1;
  module_0 modCall_1 (
      id_3,
      id_11
  );
  assign modCall_1.id_6 = 0;
  tri0 id_15;
  wire id_16;
  assign id_1[1&1] = id_15 ~^ 1;
  always @(negedge id_3 or negedge id_3) begin : LABEL_0
    #1 $display(1, id_12);
  end
endmodule
