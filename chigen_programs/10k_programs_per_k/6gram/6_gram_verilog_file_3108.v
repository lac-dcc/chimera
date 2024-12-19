// Seed: 4186440404
module module_0 (
    input tri id_0,
    input uwire id_1,
    output supply0 id_2,
    input tri0 id_3,
    output tri id_4,
    output wand id_5,
    input wire id_6,
    input tri0 id_7,
    output uwire id_8,
    input tri1 id_9,
    input wand id_10,
    output wire id_11
);
  supply0 id_13;
  assign id_2 = 1'b0;
  assign id_4 = id_10;
  wire id_14, id_15;
  assign id_13 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1,
    input logic id_2,
    output supply1 id_3,
    output wand id_4
);
  supply1 id_6;
  logic id_7, id_8, id_9, id_10, id_11;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_0,
      id_3,
      id_1,
      id_0,
      id_0,
      id_3,
      id_0,
      id_0,
      id_4
  );
  assign modCall_1.type_3 = 0;
  assign id_3 = 1;
  always @(negedge {~id_10,
    id_2,
    id_9
  } or posedge 1 == 1)
  begin : LABEL_0
    id_8 <= id_10;
    if ((id_6)) $display(1, 1, 1, 1);
  end
endmodule
