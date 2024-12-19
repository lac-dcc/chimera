// Seed: 773887938
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1;
endmodule
module module_1 ();
  wire id_2;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_9 = 1 == id_1;
  module_0 modCall_1 (
      id_1,
      id_9
  );
  initial id_1 = 1'd0;
endmodule
