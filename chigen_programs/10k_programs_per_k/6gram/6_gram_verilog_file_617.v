// Seed: 3479335698
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri1 id_3,
    input uwire id_4,
    input wand id_5,
    input supply1 id_6,
    input wire id_7,
    output wor id_8,
    output tri id_9,
    output tri id_10,
    input wire id_11,
    output supply0 id_12,
    input tri id_13,
    input wor id_14,
    output tri0 id_15,
    output uwire id_16,
    output wand id_17,
    input wand id_18
);
  assign id_9 = id_7;
  logic id_20;
  ;
  wire id_21;
  ;
  wire id_22;
  initial begin : LABEL_0
    disable id_23;
    release id_17;
  end
endmodule
module module_1 #(
    parameter id_4 = 32'd77,
    parameter id_5 = 32'd85
) (
    output supply1 id_0,
    input tri1 id_1
);
  logic id_3, _id_4;
  assign id_3 = id_1 == (-1);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1
  );
  wire _id_5;
  wire id_6;
  logic [7:0] id_7;
  wire id_8;
  assign id_7[1 : 1] = id_5;
  logic [id_4 : id_5  &  -1] id_9;
endmodule
