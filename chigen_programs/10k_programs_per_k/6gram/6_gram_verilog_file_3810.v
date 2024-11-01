// Seed: 2001918647
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
    id_12
);
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_13;
  tri  id_14 = 1;
  wire id_15;
  wire id_16;
  wire id_17;
  initial begin
    id_10 = id_14 == 1'b0;
    $display;
  end
  wire id_18 = 1;
  wire id_19;
  tri0 id_20 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  reg id_7 = 1'h0, id_8;
  reg id_9;
  always @(id_5) begin
    id_8 <= 1'd0;
    id_9 <= 1 - id_7;
  end
  assign id_9 = id_2;
  wire id_10 = ~id_8;
  wor  id_11 = 1;
  module_0(
      id_4, id_10, id_10, id_1, id_4, id_4, id_4, id_10, id_1, id_11, id_10, id_4
  );
  always @(id_8 or posedge id_6) begin
    #1 id_9 = 1'h0;
  end
endmodule
