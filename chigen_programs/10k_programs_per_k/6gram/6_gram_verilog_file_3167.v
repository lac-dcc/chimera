// Seed: 1437145184
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout tri0 id_3;
  input wire id_2;
  output wire id_1;
  assign id_3 = 1;
  assign module_1.id_6 = 0;
  reg  id_5;
  wire id_6;
  initial begin : LABEL_0
    id_5 <= -1;
  end
endmodule
module module_1 (
    input  wor   id_0,
    input  wand  id_1,
    input  uwire id_2,
    input  tri   id_3,
    output wand  id_4
);
  assign id_4 = (-1 && {-1{-1'b0}}) == -1;
  always @(posedge (id_3)) begin : LABEL_0
    fork
      id_6(id_0 <= ~&{1{id_1}}, id_0);
      begin : LABEL_1
        if (1 == 1) begin : LABEL_2
          id_6 <= id_3;
        end
        id_6 <= 1'b0;
      end
    join
    id_6 <= 1;
    id_6 <= id_0 == 1'b0 > -1'b0;
  end
  wire [1 : 1] id_7;
  logic id_8 = id_3;
  assign id_4 = id_3;
  rtran (id_3, ~id_0, -1);
  module_0 modCall_1 (
      id_8,
      id_7,
      id_8,
      id_7
  );
  assign id_8 = 1 == 1'b0 ? 1 : 1 ? -1 : -1;
  wire id_9;
endmodule
