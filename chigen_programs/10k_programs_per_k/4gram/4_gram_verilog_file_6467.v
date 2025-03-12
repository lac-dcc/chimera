// Seed: 2675948896
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input wire id_3,
    input uwire id_4,
    output tri1 id_5
);
  bit id_7;
  always @(posedge id_1) begin : LABEL_0
    id_7 = -1;
  end
endmodule
module module_1 #(
    parameter id_0 = 32'd41,
    parameter id_3 = 32'd16
) (
    input wor _id_0,
    input wor id_1,
    output uwire id_2,
    input supply1 _id_3,
    input tri0 id_4,
    output tri1 id_5,
    input supply1 id_6,
    input tri id_7,
    input wor id_8
);
  logic [7:0] id_10;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_1,
      id_7,
      id_5
  );
  assign modCall_1.id_4 = 0;
  logic id_11;
  ;
  assign id_10[id_0] = 1'h0;
  wire [1 : id_3] id_12;
endmodule
