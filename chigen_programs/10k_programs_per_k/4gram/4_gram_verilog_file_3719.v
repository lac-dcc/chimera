// Seed: 1562738588
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  wire id_5;
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
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_5
  );
  supply1 id_9 = 1;
  always_latch @(1 or id_5) begin : LABEL_0
    wait (id_4);
  end
endmodule
