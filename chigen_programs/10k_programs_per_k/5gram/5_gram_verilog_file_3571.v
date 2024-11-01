// Seed: 3814441129
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
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = 1 || 1;
endmodule
module module_1 #(
    parameter id_6 = 32'd40,
    parameter id_7 = 32'd54
) (
    input  logic id_0
    , id_3,
    output uwire id_1
);
  logic id_4 = id_0;
  module_0(
      id_3, id_3, id_3, id_3, id_3, id_3, id_3, id_3, id_3, id_3, id_3, id_3, id_3, id_3
  );
  logic id_5 = id_0;
  always_comb @(posedge id_0 or posedge |(id_0 ? id_1++
  : 1))
  begin
    id_4 <= 1;
  end
  always @(posedge 1'h0) id_4 = 1;
  defparam id_6.id_7 = 1;
endmodule
