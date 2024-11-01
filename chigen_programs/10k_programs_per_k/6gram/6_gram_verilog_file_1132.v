// Seed: 2789148922
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input tri0 id_2,
    input uwire id_3,
    output wand id_4,
    output wand id_5
);
  assign id_5 = 1;
  assign id_4 = id_0;
endmodule
module module_1 (
    input supply0 id_0,
    output tri1 id_1,
    output uwire id_2,
    input logic id_3,
    input supply1 id_4,
    output wire id_5,
    output supply1 id_6
);
  initial begin
    force id_1 = id_3;
    wait (1'h0);
  end
  module_0(
      id_0, id_4, id_4, id_0, id_5, id_2
  );
endmodule
