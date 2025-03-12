// Seed: 3436140301
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    output supply0 id_2
    , id_7,
    input wor id_3,
    input tri0 id_4,
    input supply1 id_5
);
  localparam id_8 = 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri0  id_1,
    output wor   id_2,
    inout  logic id_3,
    input  tri1  id_4
);
  always begin : LABEL_0
    @(negedge 1 or posedge -1) begin : LABEL_1
      id_3 = id_3;
    end
    id_3 = id_0;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_4,
      id_0,
      id_1
  );
endmodule
