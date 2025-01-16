// Seed: 3928912031
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  wire id_3, id_4;
  int id_5;
  wire id_6, id_7, id_8;
  wire id_9, id_10;
  assign id_9 = id_7;
  assign module_1.id_5 = 0;
  parameter id_11 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  initial id_6 = id_3;
  module_0 modCall_1 (
      id_2,
      id_6
  );
  always begin : LABEL_0
    if (id_2 - id_4) $display(id_3);
    #id_7 id_5 <= id_7;
  end
  assign id_2 = id_2;
  wire id_8;
endmodule
