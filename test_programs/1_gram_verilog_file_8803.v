// Seed: 2452812339
module module_0;
  assign id_1 = 1;
  always_ff begin : LABEL_0
    @(posedge id_1) id_2 <= 1;
  end
  wire id_3, id_4;
  wire id_5;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1
);
  final $display(id_1, -1 && -1);
  always begin : LABEL_0
    id_0 <= id_1;
    id_0 <= -1'd0 | id_1;
    id_0 = new(id_1, -1);
  end
  module_0 modCall_1 ();
  wire id_3;
  integer id_4;
  wire id_5 = (id_3);
  wire id_6;
endmodule
