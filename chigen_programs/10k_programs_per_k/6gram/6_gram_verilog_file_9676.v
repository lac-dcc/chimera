// Seed: 186718750
module module_0 (
    input supply1 id_0,
    output uwire id_1,
    input supply1 id_2,
    input wire id_3,
    input supply0 id_4,
    output supply0 id_5,
    input wire id_6,
    input tri1 id_7,
    output wand id_8
);
  wire id_10;
  genvar id_11;
  assign id_5 = (1);
  assign id_11 = id_7;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd64,
    parameter id_5 = 32'd24
) (
    input supply1 id_0,
    input uwire id_1,
    output wand id_2
);
  defparam id_4.id_5 = 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2
  );
endmodule
