// Seed: 4103384409
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign module_1.id_1 = 0;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_1#(1'd0, 1) = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2
  );
  assign id_1 = id_2;
endmodule
