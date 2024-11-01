// Seed: 946342407
module module_0;
  task id_1;
    id_1 += 1;
  endtask
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  initial
    if (1'h0) begin
      id_2 = ~id_2;
      #1;
    end
  module_0();
endmodule
module module_2 (
    output wand  id_0,
    input  tri1  id_1,
    input  tri1  id_2,
    input  uwire id_3,
    output tri1  id_4
);
  wire id_6;
  module_0();
endmodule
module module_3 (
    inout supply0 id_0,
    output wand id_1,
    output logic id_2,
    input logic id_3,
    output wire id_4,
    input uwire id_5,
    input tri0 id_6
);
  wire id_8;
  xnor (id_0, id_3, id_5, id_6, id_8);
  module_0();
  always_latch @(1) begin
    id_2#(.id_0(1)) <= id_3;
  end
endmodule
