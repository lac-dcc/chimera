// Seed: 2497622609
module module_0 (
    output supply0 id_0,
    input tri id_1,
    output tri id_2,
    input uwire id_3,
    input wor id_4,
    input wor id_5,
    input uwire id_6,
    input uwire id_7,
    input uwire id_8,
    output supply1 id_9,
    input wire id_10,
    input wire id_11,
    input tri1 id_12,
    input supply1 id_13,
    input tri1 id_14,
    input tri id_15,
    input wand id_16,
    input supply0 id_17,
    input uwire id_18,
    output tri id_19,
    output wand id_20,
    input wire id_21,
    input wor id_22
);
  localparam id_24 = 1;
  wire id_25 = $clog2(39);
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd4
) (
    output tri1 id_0,
    input supply0 _id_1,
    output tri1 id_2,
    output wor id_3,
    input supply1 id_4
);
  wire [id_1 : -1] id_6;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_0,
      id_2,
      id_4,
      id_4
  );
endmodule
