// Seed: 329290685
module module_0;
  assign id_1 = 1;
endmodule
module module_1;
  wire id_2;
  module_0();
endmodule
module module_2 (
    input tri0 id_0,
    input wand id_1,
    input uwire id_2,
    input supply1 id_3,
    input uwire id_4,
    input tri id_5,
    input wor id_6,
    input tri id_7,
    input supply1 id_8,
    input wire id_9,
    input tri0 id_10,
    input logic id_11,
    output tri1 id_12,
    output wire id_13,
    input supply0 id_14,
    output logic id_15
);
  always begin
    id_15 = #1 id_11;
  end
  xnor (id_12, id_14, id_2, id_3, id_4, id_5, id_6, id_7, id_8, id_9);
  module_0();
endmodule
