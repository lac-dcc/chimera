// Seed: 1638904043
module module_0;
  wire id_1;
  assign module_2.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output logic [7:0] id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  assign id_4[-1] = 1;
endmodule
module module_2 (
    input  wire  id_0,
    input  tri1  id_1,
    output logic id_2
);
  initial begin : LABEL_0
    for (id_2 = (1'b0 * 1'd0); -1'h0; id_2 = (id_0)) begin : LABEL_1
      disable id_4;
    end
    wait (id_1);
  end
  module_0 modCall_1 ();
endmodule
