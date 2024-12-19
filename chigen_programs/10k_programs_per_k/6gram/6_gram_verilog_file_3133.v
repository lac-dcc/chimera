// Seed: 4019331131
module module_0 (
    input  wor   id_0,
    input  uwire id_1,
    input  tri0  id_2,
    input  wor   id_3,
    output uwire id_4
);
  uwire id_6;
  assign module_1.id_7 = 0;
  assign id_4 = id_1;
  always @(negedge id_1) begin : LABEL_0
    if (id_1) begin : LABEL_0
      case (1'b0)
        1: id_4 = id_6;
        default: id_4 = id_3;
      endcase
    end
  end
  tri1 id_7 = 1 * 1 - id_2;
  wire id_8;
  wire id_9;
  assign id_6 = id_2;
endmodule
module module_1 (
    output tri0  id_0,
    input  uwire id_1,
    input  wire  id_2,
    input  tri0  id_3,
    input  uwire id_4,
    input  tri0  id_5,
    input  tri   id_6,
    output tri1  id_7
);
  id_9(
      .id_0(1), .id_1(1 & id_1)
  );
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_3,
      id_0
  );
endmodule
