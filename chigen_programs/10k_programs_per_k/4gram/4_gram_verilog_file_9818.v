// Seed: 390179620
module module_0 (
    input  tri   id_0,
    output tri0  id_1,
    input  tri   id_2,
    input  uwire id_3,
    input  uwire id_4
);
  id_6 :
  assert property (@(posedge (id_0) == id_4) 1'b0)
  else $unsigned(88);
  ;
  wire id_7;
  parameter id_8 = 1;
  reg id_9;
  ;
  initial begin : LABEL_0
    if (id_8) begin : LABEL_1
      id_9 = id_6;
    end
  end
endmodule
module module_1 #(
    parameter id_11 = 32'd36,
    parameter id_13 = 32'd11
) (
    input tri id_0,
    input wire id_1,
    output tri1 id_2,
    input supply1 id_3,
    output wire id_4,
    output supply1 id_5,
    output tri id_6,
    input supply0 id_7,
    output uwire id_8,
    output uwire id_9,
    input uwire id_10,
    output wor _id_11,
    output wor id_12,
    input uwire _id_13
);
  assign id_9 = 1;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_3,
      id_1,
      id_1
  );
  logic [-1 : id_11] id_15 = id_7;
  assign id_15[!id_13] = 1;
endmodule
