// Seed: 3243535670
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  wire id_3, id_4;
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3
  );
  assign id_3 = 1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2
  );
endmodule
