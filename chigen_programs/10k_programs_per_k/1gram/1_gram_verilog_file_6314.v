// Seed: 1876698066
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6, id_7, id_8 = id_2;
  wire id_9, id_10;
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
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  always begin : LABEL_0
    begin : LABEL_0
      id_6 = id_7;
    end
    id_1 <= 1 - id_4;
  end
  for (id_9 = 1; 1; id_9 = 1)
  module_0 modCall_1 (
      id_4,
      id_9,
      id_8,
      id_9,
      id_6
  );
endmodule
