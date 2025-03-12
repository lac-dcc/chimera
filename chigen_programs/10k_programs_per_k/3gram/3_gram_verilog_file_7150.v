// Seed: 3220998959
module module_0;
  logic id_1, id_2;
  initial begin : LABEL_0
    if (1) id_1 = id_2;
    id_2 = id_1;
  end
  assign module_1.id_3 = 0;
  wire [-1 'b0 -  1 : -1 'b0 &  1 'b0] id_3;
  initial begin : LABEL_1
    $unsigned(75);
    ;
  end
  assign id_1 = !{id_2, 1};
endmodule
module module_1 (
    input  uwire id_0,
    inout  wor   id_1,
    output logic id_2,
    input  wire  id_3,
    input  uwire id_4
);
  always @(posedge 1) begin : LABEL_0
    id_2 = ~id_3 - -1;
  end
  module_0 modCall_1 ();
endmodule
