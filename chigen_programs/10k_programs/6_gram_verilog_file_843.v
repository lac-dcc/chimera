// Seed: 2250354510
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input tri1 id_2,
    output tri0 id_3,
    output supply0 id_4,
    output wand id_5,
    input wire id_6,
    output supply0 id_7,
    input uwire id_8,
    output wand id_9,
    input uwire id_10,
    input wand id_11,
    input uwire id_12,
    output tri id_13,
    input tri1 id_14,
    output wand id_15,
    input supply1 id_16,
    input tri0 id_17,
    input tri id_18,
    input uwire id_19,
    input wire id_20,
    input wor id_21,
    output uwire id_22
);
endmodule
module module_1 #(
    parameter id_12 = 32'd30,
    parameter id_13 = 32'd78
) (
    output wand id_0,
    output uwire id_1,
    input wor id_2,
    input uwire id_3,
    input tri1 id_4,
    output supply1 id_5,
    input tri id_6,
    input tri1 id_7,
    output supply1 id_8
);
  assign id_8 = id_2;
  wire id_10;
  module_0(
      id_6,
      id_7,
      id_4,
      id_8,
      id_8,
      id_5,
      id_6,
      id_1,
      id_7,
      id_1,
      id_7,
      id_2,
      id_2,
      id_1,
      id_4,
      id_5,
      id_7,
      id_2,
      id_3,
      id_6,
      id_6,
      id_7,
      id_1
  );
  generate
    for (id_11 = 1; id_11; id_10 = id_10) begin
      defparam id_12.id_13 = (1) == 1;
    end
  endgenerate
endmodule
