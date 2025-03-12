// Seed: 3374736248
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input supply1 id_2,
    input wire id_3,
    input tri1 id_4,
    output logic id_5
);
  assign id_5 = 1 & id_4;
  always @(id_2 or negedge id_1) begin : LABEL_0
    id_5 <= 1;
    if (-1'b0) begin : LABEL_1
      id_5 = -1'b0;
      id_5 <= #id_0 1'd0;
    end
  end
  wire id_7;
  wire id_8;
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd44
) (
    output tri0  id_0,
    input  tri   id_1,
    input  tri1  id_2,
    input  wand  _id_3,
    output logic id_4
);
  logic [1 : id_3] id_6;
  logic id_7;
  initial begin : LABEL_0
    id_4 = 1;
    assign id_0 = id_3;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
