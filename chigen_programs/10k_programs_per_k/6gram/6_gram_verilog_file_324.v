// Seed: 1795969305
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign module_2.id_0 = 0;
  wire id_6;
  wire id_7 = id_5, id_8;
  initial begin : LABEL_0
    wait (id_8);
    #1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always disable id_4;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3,
      id_2,
      id_3
  );
endmodule
module module_2 (
    input  tri   id_0,
    input  wor   id_1,
    output logic id_2
);
  wire id_4 = id_1;
  parameter integer id_5 = 1;
  wire id_6;
  initial begin : LABEL_0
    disable id_7;
    id_2 = -1;
  end
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_4,
      id_6
  );
endmodule
