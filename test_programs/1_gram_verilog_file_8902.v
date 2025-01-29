// Seed: 1594431671
module module_0 #(
    parameter id_14 = 32'd34,
    parameter id_15 = 32'd39
) (
    input tri0 id_0,
    output supply0 id_1,
    input tri0 id_2,
    output tri id_3,
    output tri1 id_4,
    output tri0 id_5,
    input wand id_6,
    input tri1 id_7,
    input wire id_8,
    input tri1 id_9
);
  wire id_11;
  tri0 id_12, id_13;
  assign module_1.id_2 = 0;
  defparam id_14 = 1, id_15 = id_13;
  wire id_16;
endmodule
module module_1 (
    output wire  id_0,
    output uwire id_1,
    input  wand  id_2
);
  wire id_4, id_5;
  not primCall (id_0, id_4);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule
