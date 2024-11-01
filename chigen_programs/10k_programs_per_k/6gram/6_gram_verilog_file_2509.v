// Seed: 115319505
module module_0 (
    output supply1 id_0,
    input uwire id_1,
    output wand id_2,
    output tri id_3,
    input supply1 id_4,
    input tri id_5,
    input supply0 id_6,
    output uwire id_7,
    input tri0 id_8,
    input tri0 id_9,
    output supply0 id_10
);
  wire id_12;
  wor  id_13 = {id_6, 1 <= id_8 - 1, 1, 1 ^ 1'd0}, id_14;
endmodule
module module_1 (
    output tri id_0,
    output wand id_1,
    input wand id_2,
    output tri id_3,
    input supply0 id_4,
    output wor id_5,
    input tri id_6
);
  wire id_8;
  xor (id_0, id_4, id_2, id_6, id_8);
  module_0(
      id_1, id_6, id_5, id_0, id_6, id_4, id_6, id_5, id_6, id_6, id_0
  );
  always @(1'd0) begin
    id_5 = id_2;
  end
endmodule
