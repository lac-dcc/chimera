// Seed: 139516021
module module_0 #(
    parameter id_16 = 32'd2,
    parameter id_17 = 32'd74
) (
    output tri id_0,
    input tri id_1,
    input uwire id_2,
    input tri id_3,
    input supply0 id_4,
    input tri1 id_5,
    input uwire id_6,
    input tri0 id_7,
    input supply1 id_8,
    input wor id_9,
    input tri id_10,
    input supply1 id_11
);
  wire id_13;
  wire id_14;
  wire id_15;
  assign module_1.id_4 = 0;
  defparam id_16.id_17 = id_2 != 1'h0;
endmodule
module module_1 (
    input wire id_0,
    output uwire id_1,
    input wand id_2,
    input supply0 id_3,
    input wire id_4,
    input uwire id_5,
    output logic id_6,
    output supply1 id_7,
    input wand id_8,
    input uwire id_9,
    input tri0 id_10,
    output wor id_11,
    output tri id_12
);
  always_ff id_6 <= 1;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_2,
      id_9,
      id_9,
      id_10,
      id_10,
      id_8,
      id_5,
      id_0
  );
endmodule
