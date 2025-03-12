// Seed: 2273619714
module module_0 (
    input tri id_0,
    input supply0 id_1,
    input supply1 id_2,
    output tri0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    output uwire id_6,
    output supply0 id_7,
    input uwire id_8,
    input tri0 id_9,
    output wand id_10,
    input wire id_11,
    input wire id_12,
    input wand id_13,
    input wor id_14
);
  logic id_16 = !id_1;
  assign id_16 = id_12;
  wire id_17, id_18, id_19;
  assign id_16 = id_12 - 1;
  wire id_20;
endmodule
module module_1 #(
    parameter id_4 = 32'd54
) (
    input tri0 id_0,
    input tri0 id_1,
    input supply0 id_2,
    output supply0 id_3,
    input supply0 _id_4,
    input wor id_5,
    input tri id_6
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_2,
      id_3,
      id_3,
      id_2,
      id_6,
      id_3,
      id_1,
      id_1,
      id_1,
      id_5
  );
  wire [id_4 : 1 'd0] id_8;
endmodule
