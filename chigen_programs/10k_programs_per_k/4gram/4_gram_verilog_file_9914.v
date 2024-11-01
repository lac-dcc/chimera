// Seed: 1168452405
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    input supply0 id_2,
    output wire id_3,
    input supply1 id_4,
    input supply1 id_5,
    input tri id_6,
    output supply0 id_7,
    output wire id_8
);
endmodule
module module_1 #(
    parameter id_10 = 32'd4,
    parameter id_11 = 32'd54
) (
    output supply0 id_0,
    output wire id_1,
    output wor id_2,
    output wand id_3,
    input wor id_4,
    output wor id_5,
    output wire id_6,
    input wor id_7,
    input wor id_8
);
  assign id_2 = 1'b0;
  defparam id_10.id_11 = 1; module_0(
      id_8, id_6, id_4, id_6, id_8, id_8, id_7, id_5, id_2
  );
  wire id_12 = id_7;
  reg  id_13 = 1;
  wire id_14, id_15, id_16;
  assign id_2 = id_14;
  always_latch begin
    id_13 = id_4 <-> 1'd0;
    id_16 = 1;
    if (1'b0) id_13 <= 1;
  end
endmodule
