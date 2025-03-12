// Seed: 2938595300
module module_0 #(
    parameter id_9 = 32'd4
) (
    input uwire id_0,
    input wire id_1,
    input tri0 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input tri id_5,
    input tri1 id_6,
    output tri0 id_7
);
  logic _id_9;
  assign id_7 = id_9;
  wire [id_9 : ~  id_9] id_10;
  tri0 id_11;
  logic id_12, id_13;
  assign id_11 = 1;
  wire id_14;
  ;
  always @(posedge id_10) begin : LABEL_0
    if (1) begin : LABEL_1
      deassign id_7;
    end
  end
endmodule
module module_1 #(
    parameter id_1 = 32'd84,
    parameter id_5 = 32'd21
) (
    input  tri1 id_0,
    input  tri1 _id_1,
    output wor  id_2
);
  wire id_4;
  logic [id_1 : -1] _id_5, id_6, id_7;
  logic [id_5 : 1] id_8 = -1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_7 = 0;
endmodule
