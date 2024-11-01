// Seed: 4016995763
module module_0 #(
    parameter id_10 = 32'd44,
    parameter id_9  = 32'd19
) (
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
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_7 = 1;
  defparam id_9.id_10 = 1'd0;
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
    id_10
);
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_8 = 1;
  module_0(
      id_10, id_8, id_10, id_9, id_5, id_8, id_10, id_10
  );
  reg id_11;
  always @(negedge id_1 - id_5) begin
    id_11 <= id_3 & 1;
  end
endmodule
