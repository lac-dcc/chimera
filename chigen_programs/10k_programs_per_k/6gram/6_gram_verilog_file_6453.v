// Seed: 1115886577
module module_0;
  timeprecision 1ps;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    output wire id_2,
    input wor id_3,
    output wire id_4,
    output supply1 id_5,
    input supply1 id_6,
    output wand id_7
);
  assign id_7 = 1'h0;
  module_0();
endmodule
module module_2 (
    output tri   id_0,
    output tri0  id_1,
    output tri1  id_2,
    input  tri0  id_3,
    output wor   id_4,
    output tri   id_5,
    output wand  id_6,
    input  tri   id_7,
    input  tri   id_8,
    output logic id_9
);
  wire id_11;
  wire id_12;
  wire id_13;
  nor (id_0, id_11, id_12, id_13, id_3, id_7, id_8);
  module_0();
  always @(posedge 1'b0 or negedge id_13) begin
    id_9 <= 1;
  end
endmodule
