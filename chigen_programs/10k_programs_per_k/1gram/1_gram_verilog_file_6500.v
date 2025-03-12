// Seed: 2003629735
module module_0 (
    input supply1 id_0
    , id_9,
    output uwire id_1,
    input uwire id_2,
    input uwire id_3,
    input wire id_4,
    output tri0 id_5,
    output logic id_6,
    input tri1 id_7
);
  logic id_10;
  always
    case (-1'h0)
      -1: ;
    endcase
  assign id_1 = 1;
  assign module_1.id_6 = 0;
  always id_6 <= id_9;
  assign id_9 = 1;
endmodule
module module_1 #(
    parameter id_12 = 32'd92,
    parameter id_2  = 32'd30,
    parameter id_6  = 32'd22,
    parameter id_8  = 32'd34
) (
    output supply0 id_0,
    output supply0 id_1,
    input tri1 _id_2,
    input tri0 id_3,
    output wire id_4,
    input tri1 id_5,
    input wand _id_6,
    output wand id_7,
    input wire _id_8
    , id_18,
    input tri id_9,
    output tri id_10[~  id_12 : 1],
    input tri1 id_11,
    output wand _id_12,
    input supply1 id_13,
    output logic id_14[id_8 : 1  -  id_6  -  id_2],
    output tri id_15,
    input tri0 id_16
);
  initial if (1) id_14 = 1;
  module_0 modCall_1 (
      id_16,
      id_10,
      id_13,
      id_9,
      id_3,
      id_7,
      id_14,
      id_3
  );
  wire [1 : -1] id_19;
  xor primCall (id_14, id_3, id_9, id_13, id_18, id_5, id_11, id_16);
endmodule
