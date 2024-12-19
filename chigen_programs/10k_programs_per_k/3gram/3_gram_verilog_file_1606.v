// Seed: 149896631
module module_0 (
    output tri1 id_0,
    output wor  id_1
);
  assign id_1 = (id_3[1'b0]);
endmodule
module module_1 (
    input  tri   id_0,
    input  wand  id_1,
    input  uwire id_2,
    output tri1  id_3,
    input  wor   id_4,
    input  wire  id_5,
    input  wire  id_6,
    input  tri   id_7,
    output uwire id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_3,
      id_8
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign module_3.type_9 = 0;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = 1;
  reg id_7;
  module_2 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_3,
      id_3,
      id_1,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3
  );
  always_comb @(id_6 or posedge 1) begin : LABEL_0
    if (id_6)
      if (id_5) begin : LABEL_0
        id_7 <= id_7;
        id_7 <= 1;
        assume (1'b0 - id_4);
        id_6 = 1 & 1;
      end else begin : LABEL_0
        id_6 <= id_5;
      end
  end
  wire id_8;
endmodule
