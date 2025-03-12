// Seed: 3154639222
module module_0 (
    input  tri1 id_0,
    output tri0 id_1
);
  uwire id_3;
  always @(posedge 1) begin : LABEL_0
    $signed(46);
    ;
  end
  always_ff @(negedge id_3) begin : LABEL_1
    assume (1 != {-1{1}});
  end
  assign id_3 = -1;
  assign id_3 = id_0;
  logic id_4;
  uwire id_5 = -1;
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1,
    output tri1 id_2,
    input supply0 id_3,
    input tri id_4
);
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
