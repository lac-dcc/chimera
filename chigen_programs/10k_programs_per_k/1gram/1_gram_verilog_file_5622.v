// Seed: 415578334
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_2,
      id_1
  );
  wire id_3, id_4;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_5,
      id_5,
      id_4
  );
endmodule
