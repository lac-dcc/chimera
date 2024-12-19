// Seed: 159398953
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  assign id_2 = 1;
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
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always
    wait (1) begin : LABEL_0
      id_3 <= 1;
    end
  wire id_6;
  wire id_7;
  wire id_8;
  wire id_9;
  module_0 modCall_1 (
      id_5,
      id_9,
      id_5,
      id_9
  );
endmodule
