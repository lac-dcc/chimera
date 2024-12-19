// Seed: 2537470438
module module_0 (
    input logic id_0
);
  always begin : LABEL_0
    id_2 <= 1 ^ id_2 - 1'd0;
    id_2 = id_0;
  end
  wire id_3;
endmodule
module module_1 (
    input  tri1  id_0,
    input  tri0  id_1,
    output tri1  id_2,
    output tri0  id_3,
    input  logic id_4
);
  logic [7:0] id_6;
  reg id_7;
  module_0 modCall_1 (id_4);
  assign modCall_1.id_2 = 0;
  wire id_8;
  for (id_9 = 1; id_4; id_9 = 1) begin : LABEL_0
    initial begin : LABEL_0
      if (id_0 & 1)
        if (id_4 ? 1 : id_4 + 1) begin : LABEL_0
          id_6[1] <= !id_9;
        end else if (id_4) #1 id_7 <= id_4;
    end
  end
  wire id_10;
endmodule
