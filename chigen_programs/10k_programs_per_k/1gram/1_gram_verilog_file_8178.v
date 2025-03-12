// Seed: 2541470441
module module_0 (
    id_1
);
  input wire id_1;
  logic id_2;
  ;
  initial id_2 <= 1;
  assign module_1.id_3 = 0;
  initial begin : LABEL_0
    begin : LABEL_1
      id_2 = -1 & id_2;
      id_2 <= id_2 ? id_1 : id_1;
    end
  end
endmodule
module module_1 #(
    parameter id_4 = 32'd65
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  output wire id_5;
  inout wire _id_4;
  inout reg id_3;
  output tri0 id_2;
  input wire id_1;
  logic [7:0][-1 : -1] id_6, id_7;
  always_ff begin : LABEL_0
    id_3 <= 1;
    id_6[id_4] = id_6 ** 1'b0;
  end
  assign id_2 = id_4 & id_4;
  module_0 modCall_1 (id_1);
endmodule
