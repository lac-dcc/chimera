// Seed: 879395067
module module_0 (
    input tri1 id_0,
    output tri id_1,
    input uwire id_2,
    output supply1 id_3,
    input tri0 id_4,
    input tri1 id_5,
    output wor id_6,
    output wor id_7,
    input wand id_8,
    input wand id_9
);
  wire id_11;
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    inout logic id_2,
    output wand id_3,
    input wire id_4,
    output supply1 id_5,
    output supply1 id_6,
    input supply0 id_7,
    output wor id_8,
    output wire id_9
);
  assign id_6 = 1;
  module_0(
      id_7, id_6, id_1, id_9, id_1, id_1, id_0, id_5, id_1, id_1
  );
  always begin : id_11
    @(*) id_2 <= 1 == id_4;
  end
endmodule
