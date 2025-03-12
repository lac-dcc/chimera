// Seed: 1451269239
module module_0 #(
    parameter id_10 = 32'd74
) (
    output wire id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    output wand id_4,
    input tri0 id_5,
    output tri id_6,
    input wire id_7
);
  wire id_9;
  assign id_4 = 1;
  localparam id_10 = 1;
  wire id_11;
  assign id_9 = 1;
  localparam [id_10 : -1] id_12 = id_10;
endmodule
module module_1 (
    input wire id_0,
    output supply0 id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_9 = 0;
endmodule
