// Seed: 4062596745
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_11 = id_5, id_12;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  not primCall (id_2, id_1);
  inout wire id_1;
  assign id_2 = -1'h0 == 1'h0;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule
