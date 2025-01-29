// Seed: 1774171420
module module_0 (
    input wor id_0,
    input wire id_1,
    input wire id_2,
    output supply0 id_3,
    input tri1 id_4,
    output wire id_5,
    output supply0 id_6,
    input supply0 id_7,
    input tri id_8,
    output supply1 id_9,
    output wand id_10,
    output tri0 id_11,
    input tri1 id_12,
    output tri1 id_13,
    input tri0 id_14,
    input tri id_15,
    input tri id_16,
    input wire id_17,
    input wire id_18,
    output supply1 id_19,
    input uwire id_20,
    input supply1 id_21,
    output wand id_22,
    input tri1 id_23,
    input uwire id_24
);
  assign module_1.type_4 = 0;
  id_26 :
  assert property (@(posedge -1) 1'b0 == id_12) begin : LABEL_0
    #1 begin : LABEL_0
    end
    id_11 = 1 ^ 1'b0;
  end
endmodule
module module_1 (
    input  tri1  id_0,
    input  tri1  id_1,
    inout  wand  id_2,
    input  wor   id_3,
    output wor   id_4,
    output tri   id_5,
    input  wire  id_6,
    output wor   id_7,
    input  uwire id_8,
    input  tri1  id_9,
    input  wor   id_10,
    output tri0  id_11
);
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5,
      id_9,
      id_1,
      id_7,
      id_2,
      id_4,
      id_1,
      id_7,
      id_10,
      id_0,
      id_6,
      id_8,
      id_8,
      id_4,
      id_2,
      id_0,
      id_2,
      id_10,
      id_8
  );
  assign id_7 = !1;
endmodule
