// Seed: 1395125262
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output supply1 id_2,
    output tri id_3,
    output tri0 id_4,
    output wand id_5,
    output wor id_6,
    input wor id_7,
    input supply0 id_8,
    input tri1 id_9,
    input supply0 id_10,
    output uwire id_11,
    output supply0 module_0,
    input tri1 id_13
);
  always @("" or 1 * id_13) $display;
  assign id_5 = 1;
  assign id_6 = 1;
  assign id_2 = 1'b0;
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    output tri id_0,
    output logic id_1,
    input logic id_2,
    input wire id_3,
    output wire id_4,
    input supply0 id_5,
    input tri id_6
);
  always @(1'b0 * id_5) begin
    id_1 <= id_2;
  end
  module_0(
      id_3, id_5, id_4, id_0, id_4, id_0, id_4, id_5, id_5, id_5, id_3, id_4, id_4, id_6
  ); id_8 :
  assert property (@(negedge id_8++ == id_2) 1)
  else $display(1'b0, id_3, 1);
  final $display;
  wor id_9 = id_8 == id_6;
endmodule
