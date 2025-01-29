// Seed: 3942535443
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  id_5(
      -1, id_3, id_2, (id_3), 1
  );
  wire id_6, id_7;
  assign id_1 = -1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3
  );
  assign modCall_1.id_1 = 0;
  localparam id_5 = 1'b0;
endmodule
