// Seed: 2211379045
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always assign id_3 = id_1;
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
  output reg id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4
  );
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always begin : LABEL_0
    id_7 <= -1;
  end
  wire [1 : -1] id_8 = id_2;
endmodule
