// Seed: 2417621281
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
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
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1;
  reg id_9;
  nor primCall (id_2, id_8, id_10, id_1, id_11, id_3, id_6, id_5);
  initial begin : LABEL_0
    id_9 <= id_6;
    if (1) id_4 = 1;
  end
  assign id_9 = 1'b0;
  wire id_10;
  wand id_11 = id_1 * id_6;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_10,
      id_2
  );
endmodule
