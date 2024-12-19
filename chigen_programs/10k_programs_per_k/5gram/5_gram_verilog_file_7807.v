// Seed: 1415958427
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output supply0 id_2,
    output supply0 id_3,
    input tri0 id_4,
    input wire id_5
);
  always @(id_0)
    if (((id_0)))
      if (id_4) begin : LABEL_0
        id_3 = id_4 - 1'h0;
      end
  wire id_7;
  wire id_8;
endmodule
module module_1 (
    input  uwire id_0,
    inout  wire  id_1,
    input  tri1  id_2,
    input  tri0  id_3,
    input  uwire id_4,
    output tri0  id_5,
    input  wire  id_6,
    output tri0  id_7,
    input  uwire id_8,
    output uwire id_9,
    input  wor   id_10,
    input  tri0  id_11,
    output wor   id_12,
    input  uwire id_13,
    output tri1  id_14
);
  initial
    #1
      case (id_13 - !id_6)
        default: id_1 = id_13 == id_3;
      endcase
  module_0 modCall_1 (
      id_8,
      id_11,
      id_14,
      id_5,
      id_4,
      id_4
  );
  assign modCall_1.type_12 = 0;
endmodule
