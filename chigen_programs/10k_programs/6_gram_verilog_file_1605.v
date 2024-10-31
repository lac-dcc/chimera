// Seed: 2052925420
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = !id_4;
  logic [7:0] id_5;
  wire id_6 = id_5[1 : 1];
  logic [7:0] id_7;
  module_0(
      id_6, id_6, id_6, id_4, id_6, id_6
  );
  reg id_8;
  assign id_7[1] = id_1;
  initial begin
    id_1 <= 1;
  end
  reg  id_9;
  reg  id_10;
  wire id_11 = 1;
  always @(1'b0 or 1'b0 == 1) begin
    if (id_11) begin
      id_2 <= id_3;
      id_9 <= id_8 * 1;
      id_8 <= id_3 && 1'h0 ? id_10 : 1;
    end
  end
endmodule
