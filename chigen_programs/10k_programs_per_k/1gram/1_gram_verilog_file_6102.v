// Seed: 4070364577
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
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_9 = id_4;
  wire id_10;
  assign module_1.type_9 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  uwire id_3, id_4, id_5 = id_3 == 1'h0;
  xnor primCall (id_1, id_2, id_3, id_4);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_2,
      id_3,
      id_5
  );
  assign id_5 = id_3;
  always $display(id_3, ~id_4, 1, id_3);
  reg id_6;
  assign id_4 = 1;
  initial id_6 <= 1 / id_6;
endmodule
