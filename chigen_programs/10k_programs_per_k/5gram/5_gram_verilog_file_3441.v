// Seed: 763779292
module module_0 (
    output wand id_0,
    output supply1 id_1,
    input tri0 id_2,
    input wand id_3,
    input supply0 id_4
    , id_6
);
  wire id_7;
  wire id_8;
  assign module_1.type_0 = 0;
  assign id_0 = 1;
  wire id_9;
endmodule
module module_1 #(
    parameter id_7 = 32'd86,
    parameter id_8 = 32'd77
) (
    input tri1 id_0,
    output wor id_1,
    input wand id_2,
    output supply1 id_3,
    input tri id_4,
    input wand id_5
);
  pulldown (id_1, 1);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_2,
      id_5,
      id_0
  );
  defparam id_7.id_8 = 1;
endmodule
