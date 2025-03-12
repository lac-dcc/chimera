// Seed: 916387753
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output reg id_1;
  initial begin : LABEL_0
    id_1 = -1'd0;
    assert (id_2) $clog2(83);
    ;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  module_0 modCall_1 (
      id_6,
      id_1
  );
  output reg id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  generate
    for (id_8 = -1; id_1; id_6 = id_8) begin : LABEL_0
      wand id_9 = -1'b0, id_10;
    end
  endgenerate
endmodule
