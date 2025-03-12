// Seed: 2752002408
module module_0 (
    input wire id_0,
    input supply0 id_1,
    output tri0 id_2,
    output supply0 id_3,
    output supply0 id_4,
    output supply1 id_5,
    input supply1 id_6,
    output wire id_7,
    input wor id_8,
    input wire id_9,
    output tri id_10,
    input wire id_11,
    output tri id_12,
    output tri0 id_13,
    input tri id_14,
    input wor id_15,
    output tri1 id_16,
    input tri0 id_17,
    output wor id_18,
    output tri0 id_19,
    input tri0 id_20,
    input tri0 id_21,
    input tri id_22,
    output supply0 id_23,
    output wor id_24,
    output wor id_25,
    output supply1 id_26,
    input tri1 id_27,
    output uwire id_28
);
  logic id_30;
  ;
  logic id_31;
endmodule
module module_1 #(
    parameter id_0 = 32'd62
) (
    input  uwire _id_0,
    input  wand  id_1,
    output tri0  id_2
);
  assign id_2 = -1;
  logic [7:0] id_4;
  ;
  reg id_5;
  wor id_6 = -1'b0;
  assign id_5 = id_0;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2
  );
  wire id_7;
  assign id_2 = id_1;
  assign id_4[id_0-id_0] = id_6;
  initial begin : LABEL_0
    id_5 <= id_4;
  end
endmodule
