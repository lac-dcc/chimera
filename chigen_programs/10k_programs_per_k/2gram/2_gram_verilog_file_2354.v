// Seed: 3713711022
module module_0 (
    id_1
);
  output wire id_1;
  wire id_2;
  assign module_2.id_0 = 0;
  supply1 id_3 = 1;
endmodule
program module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (id_3);
  assign id_2 = 1;
  assign id_1 = id_5;
endprogram
module module_2 (
    input supply1 id_0
);
  wire id_2;
  module_0 modCall_1 (id_2);
  wire id_3;
endmodule
module module_3 (
    input  tri1  id_0,
    output tri0  id_1,
    input  logic id_2
);
  supply1 id_4 = 1 ? id_4 : 1;
  logic id_5, id_6;
  module_0 modCall_1 (id_4);
  assign modCall_1.id_3 = 0;
  assign id_1 = 1'b0;
  initial begin : LABEL_0
    id_5 = id_2;
    id_6 = 1'b0;
    if (1) begin : LABEL_0$display
      ;
    end else
      fork
      join
    #1 begin : LABEL_0
      id_6 <= #1 id_5 * 1'd0 * id_4 + id_0;
    end
  end
endmodule
