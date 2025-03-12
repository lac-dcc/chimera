// Seed: 4018950144
module module_0 (
    input tri id_0,
    output supply1 id_1,
    input supply0 id_2,
    output supply1 id_3,
    output tri0 id_4,
    input wor id_5,
    input tri1 id_6,
    output uwire id_7,
    input tri id_8,
    output wire id_9,
    input uwire id_10,
    input wand id_11,
    output wire id_12,
    input wor id_13
);
  logic id_15;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd59
) (
    input supply1 id_0,
    output logic id_1,
    input uwire _id_2,
    output tri1 id_3,
    output supply1 id_4,
    output tri1 id_5,
    input wor id_6,
    output tri1 id_7
);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_6,
      id_3,
      id_4,
      id_0,
      id_6,
      id_5,
      id_0,
      id_5,
      id_0,
      id_0,
      id_7,
      id_0
  );
  assign modCall_1.id_0 = 0;
  wire [id_2 : -1] id_9;
  wire [1 : -1] id_10;
  buf primCall (id_7, id_6);
  initial id_1 <= "";
endmodule
