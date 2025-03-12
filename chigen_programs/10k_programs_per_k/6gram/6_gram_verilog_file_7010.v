// Seed: 4294041417
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always #1 begin : LABEL_0
    fork
      id_5;
      id_6(-1'b0, 1);
    join
  end
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
    id_9
);
  inout logic [7:0] id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1
  );
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_5 = id_8;
  assign id_9[1] = -1;
endmodule
