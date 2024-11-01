// Seed: 3953763867
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input wand id_2,
    output wire id_3,
    output tri1 id_4,
    input tri0 id_5,
    input supply0 id_6,
    output tri1 id_7,
    input supply1 id_8,
    output supply1 id_9
);
  wire id_11;
  always @(negedge 1) begin
    if (id_6) begin
      fork
        id_12(id_8);
      join
    end
  end
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    output wor id_2,
    input tri0 id_3,
    input wor id_4,
    input supply1 id_5,
    output tri0 id_6,
    output wand id_7,
    output wand id_8,
    input tri id_9,
    output wor id_10,
    input supply0 id_11,
    input tri id_12,
    output tri id_13,
    inout wand id_14
);
  wire id_16;
  module_0(
      id_9, id_5, id_14, id_10, id_13, id_3, id_11, id_6, id_14, id_14
  );
endmodule
