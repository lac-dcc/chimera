// Seed: 1838559441
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7;
  initial begin : LABEL_0
    disable id_8;
    disable id_9;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_5,
      id_3,
      id_3,
      id_1
  );
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
endmodule
