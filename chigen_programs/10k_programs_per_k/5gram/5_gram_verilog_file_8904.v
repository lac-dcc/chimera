// Seed: 160911461
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input wire id_2,
    input tri id_3,
    input tri id_4,
    output tri0 id_5,
    output tri1 id_6,
    input tri0 id_7,
    input supply1 id_8,
    output supply1 id_9,
    input supply0 id_10,
    input supply0 id_11,
    input wor id_12,
    input wire id_13
    , id_27,
    input supply1 id_14
    , id_28,
    output wor id_15,
    input tri0 id_16,
    input uwire id_17,
    input tri0 sample,
    output supply1 module_0,
    output supply0 id_20
    , id_29,
    input supply1 id_21,
    output tri0 id_22,
    output wire id_23,
    input wire id_24,
    input wor id_25
);
  wire id_30;
  ;
  assign id_6 = id_18;
endmodule
module module_1 #(
    parameter id_6 = 32'd48
) (
    output wand sample,
    input  wand module_1,
    input  tri1 id_2,
    output tri0 id_3,
    input  tri1 id_4
);
  localparam id_6 = 1;
  initial
    forever begin : LABEL_0
      cover (-1 >= 1);
    end
  logic id_7;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4,
      id_2,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2,
      id_3,
      id_4,
      id_4,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_4,
      id_2,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_4,
      id_4
  );
  assign modCall_1.id_21 = 0;
  wire id_8;
  wire [id_6 : -1 'b0] id_9;
endmodule
