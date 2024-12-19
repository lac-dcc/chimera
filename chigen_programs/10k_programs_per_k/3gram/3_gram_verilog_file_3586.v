// Seed: 2794007470
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  wire id_4;
  wire id_5;
  assign module_1.id_7 = 0;
  assign id_3 = 1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always deassign id_1;
  wire id_4;
  xnor primCall (id_3, id_1, id_4, id_6, id_5);
  for (id_5 = 1'd0; 1'b0; id_1 = id_5) begin : LABEL_0
    id_6(
        .id_0(1), .id_1()
    );
  end
  assign id_4 = id_4;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_3
  );
  uwire id_7 = id_1;
  tri1  id_8 = id_5;
endmodule
