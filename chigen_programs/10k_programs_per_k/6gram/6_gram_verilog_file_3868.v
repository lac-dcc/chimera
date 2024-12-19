// Seed: 3972154685
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
  wire id_9 = id_2;
  wire id_10;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3
  );
  reg id_5 = id_2;
  xor primCall (id_2, id_4, id_1);
  wire id_6;
  initial begin : LABEL_0
    id_5 <= id_2;
    force id_6 = 1;
    id_2 <= 1;
  end
endmodule
