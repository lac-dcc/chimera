// Seed: 142582027
module module_0 (
    input uwire   id_0,
    input supply0 id_1,
    input uwire   id_2,
    input supply0 id_3
);
  wire id_5;
  wire id_6 = 1;
  wire id_7, id_8;
  assign id_6 = id_3;
  wire id_9;
endmodule
module module_1 #(
    parameter id_15 = 32'd70,
    parameter id_16 = 32'd52
) (
    output supply1 id_0,
    output tri0 id_1,
    input wor id_2,
    input wor id_3,
    output tri0 id_4,
    input wire id_5,
    input tri1 id_6,
    input supply0 id_7,
    output uwire id_8,
    input supply1 id_9,
    input supply0 id_10,
    output supply1 id_11,
    input supply0 id_12,
    output wand id_13
);
  assign id_1 = id_5;
  defparam id_15.id_16 = 1;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_2,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
