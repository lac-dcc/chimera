// Seed: 1167865375
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
  initial assert (1);
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_2
  );
  inout wire id_2;
  output wire id_1;
  wire id_4;
  always @(negedge 1);
endmodule
