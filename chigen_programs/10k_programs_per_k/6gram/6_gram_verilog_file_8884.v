// Seed: 4271661346
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    inout tri0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output wire id_5,
    output wire id_6
);
  wire id_8;
endmodule
module module_1 #(
    parameter id_17 = 32'd84,
    parameter id_18 = 32'd58
) (
    input supply1 id_0,
    output supply0 id_1,
    output wand id_2,
    input wire id_3,
    input uwire id_4,
    input wand id_5,
    input wor id_6,
    output tri0 id_7,
    input wand id_8,
    output wire id_9,
    output uwire id_10,
    output uwire id_11
);
  supply0 id_13;
  wire id_14;
  assign id_9#(.id_13(1)) = 1;
  assign id_7 = id_13;
  id_15(
      .id_0("" * id_11),
      .id_1(id_1),
      .id_2({1, id_3 == id_11} == id_1),
      .id_3(id_14),
      .id_4(1 - id_2),
      .id_5()
  );
  reg id_16;
  assign id_9 = id_3;
  defparam id_17.id_18 = id_18;
  always @(id_8) id_16 = #1  ~{1};
  module_0(
      id_4, id_13, id_13, id_4, id_8, id_13, id_7
  );
endmodule
