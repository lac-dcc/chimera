// Seed: 884505064
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
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always #1 begin : LABEL_0
    id_3 = id_6;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = id_1 || id_2 != id_5;
  tri id_6 = id_5;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_2,
      id_2,
      id_2,
      id_2,
      id_5,
      id_5
  );
endmodule
