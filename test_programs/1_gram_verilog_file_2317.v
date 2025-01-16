// Seed: 3765989077
module module_0 (
    output tri1 id_0,
    input wand id_1,
    input uwire id_2,
    input wire id_3,
    input supply0 id_4,
    input tri0 id_5,
    input supply1 id_6,
    output uwire id_7,
    output wor id_8,
    input tri0 id_9,
    input tri1 id_10,
    input wand id_11,
    input tri0 id_12
);
  assign id_7 = id_11;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd24
) (
    output tri1 id_0,
    input  wor  id_1,
    id_3
);
  assign id_0 = id_1 != id_3;
  defparam id_4 = $display;
  wire id_5, id_6;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
