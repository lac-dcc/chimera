// Seed: 541541090
module module_0 #(
    parameter id_11 = 32'd19,
    parameter id_12 = 32'd40
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
    id_10
);
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  defparam id_11.id_12 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = 1;
  logic [7:0] id_7;
  tri0 id_8 = id_2;
  module_0(
      id_8, id_5, id_8, id_8, id_1, id_5, id_8, id_4, id_8, id_1
  );
  assign id_7[1'b0] = id_6;
  xor (id_4, id_1, id_6, id_7, id_2, id_3, id_8);
  wire id_9;
  always @(posedge id_3 == 1 or negedge 1 + id_8) begin
    id_6 <= 1'b0 == (id_8);
  end
endmodule
