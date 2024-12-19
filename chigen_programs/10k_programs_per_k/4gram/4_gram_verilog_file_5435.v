// Seed: 2692958194
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
  assign id_3 = id_4[1'd0 : 1'd0];
  module_0 modCall_1 (
      id_2,
      id_1
  );
endmodule
module module_2 ();
  wire id_2;
  assign id_1 = id_2;
endmodule
module module_3;
  module_2 modCall_1 ();
endmodule
