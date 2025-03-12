// Seed: 1623611177
module module_0 (
    input wire id_0
    , id_5,
    input supply0 id_1,
    input tri id_2,
    input tri1 id_3
);
  bit id_6;
  logic [-1 : (  1  )] module_0;
  ;
  always @(posedge id_2) begin : LABEL_0
    id_6 = 1;
    id_5 <= id_1;
  end
  wire id_7;
  assign id_7 = id_0;
  wire id_8;
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    output wand id_2,
    input tri1 id_3,
    input tri1 id_4,
    input tri0 id_5,
    input supply1 id_6,
    output tri id_7,
    input tri1 id_8,
    input supply1 id_9,
    output wand id_10,
    output uwire id_11,
    input supply0 id_12,
    input uwire id_13,
    output tri1 id_14,
    input wire id_15,
    output tri0 id_16,
    input uwire id_17
);
  assign id_16 = 1;
  nor primCall (id_2, id_4, id_3, id_17, id_9, id_6, id_12, id_8, id_1, id_5, id_15, id_13);
  module_0 modCall_1 (
      id_4,
      id_9,
      id_17,
      id_4
  );
  assign modCall_1.id_5 = 0;
endmodule
