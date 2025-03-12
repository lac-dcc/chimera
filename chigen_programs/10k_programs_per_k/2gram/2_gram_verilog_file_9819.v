// Seed: 3586542802
module module_0 #(
    parameter id_9 = 32'd92
) (
    input tri0 id_0,
    output supply0 id_1
    , id_7, id_8,
    input wor id_2,
    input wand id_3,
    input tri0 id_4,
    input tri0 id_5
);
  assign id_1 = -1;
  wire _id_9;
  logic [7:0] id_10;
  assign id_8 = id_4;
  initial begin : LABEL_0
    if (1) begin : LABEL_1
      id_10[id_9] = id_2;
    end
  end
  wire id_11;
  wire id_12;
  ;
  parameter id_13 = 1;
  wire id_14;
  logic id_15, id_16;
endmodule
module module_1 #(
    parameter id_16 = 32'd10,
    parameter id_8  = 32'd48
) (
    output wor id_0,
    input tri0 id_1,
    input tri id_2,
    output wand id_3,
    output wor id_4,
    input supply0 id_5,
    output tri1 id_6,
    output wire id_7,
    output supply0 _id_8,
    output tri id_9,
    output wand id_10,
    input supply1 id_11,
    output tri id_12,
    output tri id_13,
    output tri0 id_14,
    input tri id_15,
    output wand _id_16,
    output tri id_17,
    input wor id_18
);
  logic [id_16 : id_8] id_20;
  ;
  module_0 modCall_1 (
      id_15,
      id_17,
      id_18,
      id_2,
      id_2,
      id_18
  );
  assign modCall_1.id_2 = 0;
  assign id_3 = id_2;
  genvar id_21;
endmodule
