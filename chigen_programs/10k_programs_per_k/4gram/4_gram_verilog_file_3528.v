// Seed: 3337557510
module module_0 (
    input  tri1 id_0,
    output tri  id_1,
    input  wire id_2,
    input  wire id_3,
    output tri  id_4,
    input  tri1 id_5
);
  logic [7:0] id_7;
  assign id_7[1] = 1'b0;
  reg id_8;
  id_9(
      .id_0(id_8), .id_1(1), .id_2(id_2), .id_3(id_8)
  );
  always @(*) begin : LABEL_0
    id_8 = #1 1;
  end
endmodule
module module_1 (
    input uwire id_0,
    input wire  id_1,
    input wor   id_2,
    input wor   id_3,
    input tri   id_4,
    input uwire id_5
);
  assign id_7 = id_4 & 1;
  tri0 id_8 = id_1;
  module_0 modCall_1 (
      id_2,
      id_8,
      id_5,
      id_0,
      id_8,
      id_4
  );
endmodule
