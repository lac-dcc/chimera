// Seed: 2015456842
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  logic [7:0] id_6;
  always @(posedge 1 or negedge 1'd0)
    for (id_1 = 1'b0; 1; id_6 = id_6[1])
      if (1'b0) begin : LABEL_0
        id_5 = id_5;
      end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = 1 ? 1 : 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3
  );
endmodule
