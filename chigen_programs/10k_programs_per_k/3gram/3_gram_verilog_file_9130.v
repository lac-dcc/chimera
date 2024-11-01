// Seed: 2083175015
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  initial begin
    id_3 = 1;
  end
  wire id_9;
  wire id_10;
  assign #(1'd0) id_5 = 1'b0;
  assign id_3 = id_8 > 1'b0;
endmodule
module module_1 #(
    parameter id_8 = 32'd24,
    parameter id_9 = 32'd28
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
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
  module_0(
      id_1, id_2, id_7, id_3, id_6, id_1, id_2, id_2
  ); defparam id_8.id_9 = 1'b0;
endmodule
