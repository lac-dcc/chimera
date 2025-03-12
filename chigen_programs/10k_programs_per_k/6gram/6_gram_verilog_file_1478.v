// Seed: 234297988
module module_0 ();
  logic [1 : -1] id_1;
endmodule
module module_1 (
    id_1
);
  inout logic [7:0] id_1;
  assign id_1 = id_1[-1 :-1];
  module_0 modCall_1 ();
  logic id_2;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output reg id_1;
  module_0 modCall_1 ();
  always @(id_3) begin : LABEL_0
    begin : LABEL_1
      id_1 <= -1;
      for (id_1 = 1; -1; id_2 += id_3) id_1 <= id_3;
    end
  end
endmodule
