// Seed: 2612605714
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wire id_3 = id_3;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_5 = 1;
  always begin : LABEL_0
    id_5 <= id_1 && 1;
    id_5 <= 1;
    id_5 = id_5;
    id_5 = 1;
  end
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign id_5 = id_1;
  wire id_6;
endmodule
