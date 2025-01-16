// Seed: 2344473926
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_4;
  wire id_5;
  assign module_1.id_7 = 0;
  wire id_6;
  always disable id_7[-1 : 1];
  wire id_8;
  logic [7:0] id_9 = id_7;
  wire id_10;
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
    id_10,
    id_11
);
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_12;
  always $display(id_7, -1'b0, id_1);
  wire id_13;
  and primCall (id_5, id_7, id_13, id_12, id_10, id_6, id_2, id_1, id_9);
  assign id_11 = id_10;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_8,
      id_7
  );
  id_14(
      id_2 - 1
  );
  assign id_8 = 1;
endmodule
