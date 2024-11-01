// Seed: 2575624154
module module_0 #(
    parameter id_17 = 32'd68,
    parameter id_18 = 32'd67
) (
    input tri id_0,
    output wire id_1,
    input wire id_2,
    input tri1 id_3,
    input supply1 id_4,
    output tri id_5,
    input supply1 id_6,
    output supply0 id_7,
    output uwire id_8,
    input uwire id_9,
    output uwire id_10,
    output wor id_11
);
  wire id_13;
  wire id_14;
  id_15(
      .id_0()
  );
  wire id_16;
  defparam id_17.id_18 = 1;
endmodule
macromodule module_1 (
    output uwire id_0,
    output wire id_1,
    output supply1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply0 id_5,
    input wor id_6,
    input uwire id_7,
    output tri id_8
);
  id_10(
      .id_0(id_2 - 1), .id_1(1 * id_5)
  ); module_0(
      id_6, id_0, id_4, id_6, id_4, id_0, id_6, id_1, id_1, id_6, id_1, id_2
  );
endmodule
