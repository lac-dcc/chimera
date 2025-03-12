// Seed: 2748194227
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input tri id_2,
    input supply0 id_3,
    output wand id_4,
    output wor id_5,
    output uwire id_6
);
endmodule
module module_1 #(
    parameter id_8 = 32'd63
) (
    input wand id_0,
    input uwire id_1,
    output uwire id_2,
    input wor id_3,
    input tri id_4,
    input wor id_5,
    input wire id_6,
    output logic id_7,
    output wor _id_8,
    input supply0 id_9
);
  parameter id_11 = -1;
  logic [id_8 : 1] id_12;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_9,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_6 = 0;
  always_comb @(posedge "") id_7 <= id_4;
  assign id_7 = 1;
endmodule
