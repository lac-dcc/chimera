// Seed: 1968186118
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input tri1 id_6,
    input tri0 id_7,
    input tri id_8,
    input tri id_9,
    output uwire id_10,
    output uwire id_11,
    input wire id_12,
    input supply1 id_13,
    input supply1 id_14,
    input supply0 id_15,
    input wire id_16,
    output wire id_17,
    input wor id_18,
    input wand id_19,
    input supply0 id_20,
    output wand id_21,
    output tri id_22,
    output tri1 id_23,
    input supply1 id_24,
    input tri1 id_25,
    input wire id_26,
    output wire id_27
);
  assign id_21 = id_4 !== -1;
  assign id_27 = id_3;
  parameter id_29 = 1;
  logic [-1 'b0 : ""] id_30 = {id_30, id_25, -1};
  assign id_11 = id_25;
  logic [-1 'b0 : 1] id_31;
  always @(negedge -1) begin : LABEL_0
    $signed(88);
    ;
  end
endmodule
module module_1 (
    input  tri0 id_0,
    input  tri  id_1,
    input  wor  id_2,
    output wand id_3,
    output tri  id_4
);
  assign id_4 = 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_2,
      id_4,
      id_4,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_3,
      id_0,
      id_0,
      id_1,
      id_3,
      id_4,
      id_3,
      id_1,
      id_2,
      id_0,
      id_4
  );
endmodule
