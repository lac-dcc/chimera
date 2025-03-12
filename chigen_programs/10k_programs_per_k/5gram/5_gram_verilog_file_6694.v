// Seed: 3182361427
module module_0 (
    input wor  id_0,
    input tri0 id_1
);
  always @(posedge id_1) begin : LABEL_0
    wait (1);
  end
  module_2 modCall_1 ();
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    input  wire  id_1,
    output uwire id_2
);
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_0,
      id_1
  );
endmodule
module module_2;
  wire id_1;
  assign module_0.id_1 = 0;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3
);
  output uwire id_3;
  input wire id_2;
  inout tri1 id_1;
  assign id_1 = 1;
  module_2 modCall_1 ();
  assign id_3 = -1'd0;
endmodule
