// Seed: 3871237772
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = 1 | "" & id_1;
endmodule
module module_1 (
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
  inout wire id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
endmodule
module module_2;
  logic [7:0] id_2;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_1 = 0;
  assign id_3 = id_2[1'd0];
endmodule
