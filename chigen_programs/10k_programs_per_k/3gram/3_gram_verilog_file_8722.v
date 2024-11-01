// Seed: 3831261605
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input wire id_3,
    output tri1 id_4,
    output wand id_5,
    output uwire id_6,
    input wor id_7
);
endmodule
module module_1 (
    input  wire  id_0,
    output tri1  id_1,
    output tri0  id_2,
    input  uwire id_3,
    output tri0  id_4
);
  always_latch @(1 or posedge 1) begin
    id_4 = id_3;
  end
  wire id_6;
  assign id_1 = 1 > (1'b0);
  xnor (id_4, id_6, id_3, id_0);
  module_0(
      id_3, id_0, id_0, id_3, id_2, id_2, id_4, id_3
  );
endmodule
