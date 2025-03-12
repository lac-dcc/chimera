// Seed: 2135413636
module module_0 ();
  wire id_1;
  module_3 modCall_1 (
      id_1,
      id_1,
      id_1
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output uwire id_1;
  assign id_1 = -1;
  wire [1 : 1] id_4;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  module_0 modCall_1 ();
  input wire id_2;
  output wire id_1;
  assign id_1 = id_2;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  for (id_4 = $realtime; 'b0; id_4 = id_3) begin : LABEL_0
    logic id_5;
  end
  assign id_4 = -1;
  generate
    always @(negedge id_4) begin : LABEL_1
      assert (1);
    end
  endgenerate
endmodule
