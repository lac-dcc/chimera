// Seed: 3431749324
program module_0 (
    input wand id_0,
    input tri1 id_1,
    output wand id_2,
    input supply0 id_3,
    output supply0 id_4,
    input wand id_5,
    input uwire id_6,
    input wire id_7,
    input tri0 id_8,
    input supply1 id_9,
    input wire id_10,
    input wand id_11,
    input wor id_12,
    output supply1 id_13,
    input tri id_14,
    output wor id_15
);
  initial begin
    #1 cover (id_0);
  end
endprogram
module module_1 (
    input wire id_0,
    input uwire id_1,
    output uwire id_2,
    input uwire id_3,
    input uwire id_4,
    output supply0 id_5,
    output wand id_6,
    output tri id_7,
    input uwire id_8
);
  wire id_10;
  module_0(
      id_1, id_0, id_7, id_8, id_5, id_0, id_1, id_1, id_1, id_1, id_1, id_0, id_8, id_2, id_8, id_2
  );
  wire id_11;
  xor (id_2, id_10, id_0, id_4, id_8, id_1);
endmodule
