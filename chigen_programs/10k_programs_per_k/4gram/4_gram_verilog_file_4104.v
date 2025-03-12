// Seed: 4036625094
module module_0;
  wire id_1;
  parameter id_2 = 1;
  ;
endmodule
module module_1 (
    output logic id_0,
    input  tri   id_1,
    input  uwire id_2,
    output wire  id_3,
    output uwire id_4,
    input  uwire id_5,
    output wire  id_6
);
  always_comb @(id_5)
    if (1) begin : LABEL_0
      if (1) begin : LABEL_1
        if (1) id_0 <= id_2;
        else deassign id_3;
      end
    end
  for (id_8 = ((1)); id_5; id_0 = (1'b0) ==? -1) begin : LABEL_2
    wire id_9;
  end
  always @(*) begin : LABEL_3
    $signed(49);
    ;
  end
  assign id_3 = -1'b0 ? id_2 : id_5;
  module_0 modCall_1 ();
  assign id_3 = id_5;
endmodule
