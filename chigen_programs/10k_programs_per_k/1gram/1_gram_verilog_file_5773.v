// Seed: 118413386
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  supply0 id_9 = 1;
  supply0 id_10, id_11, id_12;
  assign id_4 = 1 | id_9 && id_10;
  always $display;
  assign id_12 = 1'h0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_4,
      id_3,
      id_1,
      id_2,
      id_1,
      id_4
  );
  assign modCall_1.id_4 = 0;
  assign id_2 = id_1;
endmodule
