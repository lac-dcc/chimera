// Seed: 1222663243
module module_0 (
    output supply0 id_0,
    output tri id_1,
    input supply1 id_2,
    input uwire id_3,
    output supply0 id_4,
    input wor id_5,
    input wand id_6,
    input tri id_7,
    input supply1 id_8,
    output uwire id_9,
    output wand id_10,
    input tri0 id_11
);
  specify
    (id_13 => id_14) = (id_8  : 1'd0 : id_5, id_2  : 1  : -1);
    (id_15 => id_16) = 1;
  endspecify
endmodule
module module_1 #(
    parameter id_1 = 32'd60
) (
    input supply1 id_0,
    input wand _id_1,
    input uwire id_2,
    output tri1 id_3,
    output tri1 id_4
);
  initial begin : LABEL_0
    wait (id_2);
    if (1) begin : LABEL_1
      deassign id_3#(.id_2(1));
    end
  end
  logic [-1 : id_1] id_6;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_2,
      id_3,
      id_2,
      id_2,
      id_0,
      id_2,
      id_4,
      id_4,
      id_2
  );
  assign modCall_1.id_2 = 0;
  wire id_8;
  always @(posedge id_1) begin : LABEL_2
    wait (-1'b0);
  end
endmodule
