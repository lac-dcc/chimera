// Seed: 4258813044
module module_0 (
    id_1
);
  output wire id_1;
  assign module_3.id_5 = 0;
  assign module_2.id_1 = 0;
  assign module_1.id_1 = 0;
endmodule
module module_1 ();
  assign id_1 = ~id_1;
  wire id_3;
  module_0 modCall_1 (id_3);
endmodule
module module_2 (
    id_1
);
  output wire id_1;
  assign id_1 = 1'h0;
  module_0 modCall_1 (id_1);
  uwire id_2;
  wire  id_3;
  assign id_2 = 1'b0;
  wire id_4;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (id_4);
  initial @(posedge 1'b0) if (-1) @(id_5 or posedge (-1) or posedge -1) id_3 <= id_5;
endmodule : SymbolIdentifier
