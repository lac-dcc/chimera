// Seed: 923882775
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always @(*) begin
    fork
      #1;
      #(1) $display;
    join
  end
endmodule
module module_1 (
    input  tri1 id_0,
    input  wor  id_1,
    output wand id_2
);
  wire id_4;
  tri  id_5;
  assign id_5 = 1 & id_1;
  module_0(
      id_4, id_4, id_5, id_4, id_4, id_4, id_4, id_5, id_4
  );
  wire id_6;
  assign id_5 = 1;
endmodule
