// Seed: 51763971
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  always
    if (~id_1) begin
      disable id_5;
    end
  module_0(
      id_3, id_4, id_4, id_4
  );
endmodule
module module_2 (
    input wand id_0,
    output wor id_1,
    input supply1 id_2,
    input tri0 id_3,
    output tri0 id_4,
    input wire id_5,
    input uwire id_6,
    input wire id_7,
    input wor id_8,
    input tri id_9,
    input supply0 id_10,
    input tri0 id_11,
    input supply1 id_12,
    output tri id_13,
    input tri1 id_14,
    input tri0 id_15,
    input wor id_16,
    output wire id_17,
    output supply1 id_18
);
  reg id_20;
  always id_20 = #1 1'b0;
  wire id_21;
  wire id_22;
  always @(id_11) release id_18;
  module_0(
      id_22, id_21, id_22, id_22
  ); timeunit 1ps;
  always @(negedge id_22) begin
    id_4  = id_9;
    id_17 = 1 - 1;
  end
endmodule
