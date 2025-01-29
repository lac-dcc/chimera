// Seed: 593995585
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  localparam id_4 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_9;
  module_0 modCall_1 (
      id_1,
      id_9,
      id_5
  );
  always id_2 = (1);
  wire id_10;
  or primCall (id_2, id_5, id_1, id_6, id_9, id_7, id_4);
  assign id_9 = id_6[-1];
endmodule
