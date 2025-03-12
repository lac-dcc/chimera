// Seed: 3174393821
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    input tri0 id_2,
    input wire id_3,
    input supply1 id_4,
    output supply1 id_5
    , id_37,
    input supply0 id_6,
    input tri id_7,
    input supply0 id_8,
    input wor id_9,
    output wor id_10,
    input supply1 id_11,
    input tri1 id_12,
    input uwire id_13,
    output wor id_14,
    input wor id_15,
    output tri1 id_16,
    input supply0 id_17,
    input wor id_18,
    output wor id_19,
    input wire id_20,
    input supply0 id_21,
    input tri0 id_22,
    output logic id_23,
    output logic id_24,
    input wire id_25,
    input tri id_26,
    output wire id_27,
    input tri id_28,
    output tri0 id_29,
    output tri id_30,
    input wor id_31,
    output tri1 id_32,
    input tri0 id_33,
    output tri id_34,
    output logic id_35
);
  wire id_38;
  always
    assume (-1'b0)
    else begin : LABEL_0
      id_24 <= -1;
      id_35 <= id_20;
      if (-1) id_35 <= id_33;
      else id_23 <= id_38;
    end
  assign id_29 = id_38;
  assign module_1.id_5 = 0;
  wire id_39;
  assign id_35 = id_3;
endmodule
module module_1 #(
    parameter id_6 = 32'd63
) (
    input  uwire id_0,
    output tri   id_1,
    output tri0  id_2,
    output wand  id_3,
    output wor   id_4,
    input  tri0  id_5,
    input  tri   _id_6,
    input  uwire id_7,
    input  tri   id_8,
    output logic id_9
);
  initial @(negedge id_6) id_9 <= 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_0,
      id_5,
      id_3,
      id_7,
      id_7,
      id_0,
      id_0,
      id_4,
      id_0,
      id_5,
      id_7,
      id_3,
      id_0,
      id_2,
      id_7,
      id_5,
      id_4,
      id_8,
      id_8,
      id_7,
      id_9,
      id_9,
      id_0,
      id_7,
      id_3,
      id_5,
      id_1,
      id_2,
      id_0,
      id_1,
      id_7,
      id_4,
      id_9
  );
  wire [-1  -  -1  -  -1 : id_6] id_11;
endmodule
