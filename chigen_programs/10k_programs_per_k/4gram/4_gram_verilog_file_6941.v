// Seed: 339057768
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(negedge 1 - id_4);
  xor primCall (id_1, id_2, id_3, id_4, id_5);
  module_2 modCall_1 ();
endmodule
module module_1 ();
  wire id_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2
  );
endmodule
module module_2 ();
  pullup (id_1, id_1);
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  supply1 id_6;
  always force id_6 = id_1 - 1;
  assign id_4 = (id_6) & 1;
  module_2 modCall_1 ();
  assign id_4 = 1;
endmodule
