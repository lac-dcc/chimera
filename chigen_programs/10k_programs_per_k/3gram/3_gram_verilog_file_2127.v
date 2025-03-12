// Seed: 3266670419
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input tri0 id_2,
    input supply0 id_3,
    output tri0 id_4,
    output supply0 id_5,
    output uwire id_6,
    input wire id_7,
    input tri id_8,
    input wire id_9,
    input supply1 id_10,
    input wand id_11
);
  wire id_13;
  ;
  localparam id_14 = -1;
endmodule
module module_1 #(
    parameter id_2 = 32'd71
) (
    input wand id_0,
    output supply0 id_1,
    input wand _id_2
    , id_4
);
  always_latch @(negedge 1 - id_4)
    if (1) begin : LABEL_0
      id_4[id_2<<1] <= ~-1;
    end
  assign id_1 = id_2;
  genvar id_5;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
