// Seed: 3660608223
module module_0 (
    output uwire id_0,
    output tri   id_1,
    output wand  id_2,
    input  wand  id_3,
    input  uwire id_4,
    output wire  id_5,
    output uwire id_6,
    input  tri1  id_7,
    input  wor   id_8
);
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    input wire id_2,
    output wor id_3
);
  reg id_5;
  nor (id_3, id_1, id_0, id_5, id_2);
  module_0(
      id_3, id_3, id_3, id_0, id_0, id_3, id_3, id_0, id_1
  );
  wor id_6 = id_0;
  always_latch @(1)
    @(1 == 1'b0 or posedge id_5) begin
      id_5 <= 1;
    end
endmodule
