// Seed: 3395367444
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  supply1 id_6;
  assign id_6 = id_3 & id_1 & id_3;
  always @(1) $display(id_1);
endmodule
module module_1 (
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
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_5[1] = 1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_9,
      id_9
  );
  assign modCall_1.id_6 = 0;
endmodule
