// Seed: 2006076533
module module_0 (
    output uwire id_0,
    input  wand  id_1,
    output uwire id_2,
    output wand  id_3
);
  assign id_0 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    output tri id_2,
    input logic id_3,
    output supply1 id_4,
    input tri0 id_5,
    input uwire id_6,
    output wand id_7,
    input wire id_8,
    output logic id_9,
    output supply0 id_10,
    input uwire id_11,
    input wire id_12,
    inout wor id_13
);
  uwire id_15;
  initial begin : LABEL_0
    case (1'b0 - 1)
      ~id_6: id_7 = id_1;
      id_13: id_15 = id_11;
      1 + 1: id_9 <= (1'b0 && 1'd0);
      id_8:  id_2 = id_13 == !id_13;
    endcase
    force id_7 = 1'b0;
  end
  assign id_9 = id_3;
  module_0 modCall_1 (
      id_13,
      id_11,
      id_4,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
