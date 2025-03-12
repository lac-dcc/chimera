// Seed: 2364641464
module module_0 (
    output wor id_0,
    output tri0 id_1,
    input supply0 id_2,
    output tri0 id_3,
    input wor id_4,
    input uwire id_5
);
endmodule
module module_1 (
    input  tri1  id_0,
    output wand  id_1,
    output wand  id_2,
    inout  logic id_3,
    output wand  id_4,
    input  tri0  id_5
);
  always begin : LABEL_0
    @(posedge id_0 or negedge -1) begin : LABEL_1
      if (-1) begin : LABEL_2
        id_3 <= -1;
      end
    end
  end
  module_0 modCall_1 (
      id_2,
      id_4,
      id_0,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
