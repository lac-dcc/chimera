// Seed: 3563807362
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd74
) (
    output wand id_0,
    output logic id_1,
    input tri0 _id_2,
    input supply1 id_3,
    input uwire id_4,
    input wand id_5,
    input supply0 id_6,
    input tri id_7,
    input wor id_8,
    input supply1 id_9,
    output supply1 id_10
);
  logic id_12;
  ;
  logic id_13;
  ;
  logic [-1 : 1  -  1 'b0] id_14 = id_7 ^ 1'b0 ^ id_8;
  module_0 modCall_1 (
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14
  );
  assign id_12[-1] = -1;
  initial begin : LABEL_0
    id_1 <= id_12[-1'b0 : id_2];
    if (1 * 1) begin : LABEL_1
      assign id_1 = 1;
      id_0 += -1;
    end else id_13 <= 1;
    deassign id_1;
  end
  nand primCall (id_10, id_4, id_8, id_12, id_13, id_5, id_6, id_3, id_14);
endmodule
