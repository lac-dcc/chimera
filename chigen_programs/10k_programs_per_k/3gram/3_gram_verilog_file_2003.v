// Seed: 2337327002
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
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_9;
  assign module_2.id_6 = 0;
  assign module_1.id_2 = 0;
endmodule
module module_1 ();
  supply1 id_2 = 1;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  nand primCall (id_4, id_1, id_3, id_2);
  reg id_6 = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_5,
      id_5
  );
  reg id_7 = id_6;
  initial begin : LABEL_0
    id_6 <= id_4;
    id_6 = 1;
  end
endmodule
