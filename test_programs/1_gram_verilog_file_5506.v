// Seed: 1659339919
module module_0;
  task id_2;
    id_1 <= 1;
  endtask
  assign module_3.id_1 = 0;
endmodule : SymbolIdentifier
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = 'b0;
  parameter id_7 = "";
  module_0 modCall_1 ();
endmodule
module module_2;
  assign id_1 = -1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_2;
  wire id_3;
endmodule
module module_3;
  module_0 modCall_1 ();
  wire id_2;
  wire id_3, id_4;
endmodule
