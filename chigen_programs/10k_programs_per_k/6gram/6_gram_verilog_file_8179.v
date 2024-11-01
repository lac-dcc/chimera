// Seed: 1674274450
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output supply1 id_2,
    output wor id_3,
    output wire id_4,
    output wand id_5,
    input wand id_6,
    input uwire id_7,
    output wire id_8,
    output wand id_9,
    input supply1 id_10,
    inout wor id_11
);
  id_13(
      id_1, 1'b0, 1
  );
endmodule
module module_1 #(
    parameter id_16 = 32'd77,
    parameter id_17 = 32'd34
) (
    input supply1 id_0,
    input wire id_1,
    output supply0 id_2,
    output supply1 id_3,
    input supply0 id_4,
    input wor id_5,
    output wor id_6,
    output tri0 id_7,
    input tri0 id_8,
    input tri0 id_9,
    input tri id_10,
    output supply0 id_11,
    input wor id_12
);
  generate
    assign id_11 = id_12;
    for (id_14 = id_9; 1 == 1; id_3 = id_4) begin : id_15
      defparam id_16.id_17 = 1;
    end
  endgenerate
  module_0(
      id_8, id_10, id_6, id_7, id_14, id_11, id_14, id_14, id_11, id_2, id_10, id_14
  );
endmodule
