// Seed: 863803221
module module_0 (
    output wand id_0
);
  always @* begin
    id_0 = 1;
  end
endmodule
module module_1 (
    input tri id_0,
    input logic id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    inout wand id_5,
    output logic id_6
);
  always @(negedge 1) begin
    id_6 <= id_1;
    $display;
  end
  module_0(
      id_5
  );
  always @(id_4) begin
    fork
      #1 id_5 = 1;
      #1 id_6 = 1;
    join
  end
endmodule
module module_2 (
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  input wire id_20;
  output wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_21;
  assign id_8 = 1'b0;
endmodule
module module_3 (
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
    id_14,
    id_15,
    id_16,
    id_17
);
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_13 = 1'b0;
  module_2(
      id_6,
      id_12,
      id_3,
      id_5,
      id_10,
      id_5,
      id_8,
      id_13,
      id_2,
      id_16,
      id_7,
      id_16,
      id_3,
      id_13,
      id_15,
      id_8,
      id_3,
      id_7,
      id_5,
      id_1
  );
endmodule
