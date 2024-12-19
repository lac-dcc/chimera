// Seed: 2675436861
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
  assign module_2.id_1 = 0;
  assign id_1 = {id_3, 1, 1'b0};
endmodule : SymbolIdentifier
module module_1 ();
  wire id_2, id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_3
  );
endmodule
module module_2;
  id_1 :
  assert property (@(1'b0) id_1)
  else id_1 = id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
