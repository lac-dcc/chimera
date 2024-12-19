// Seed: 3372443900
module module_0 (
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
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_8;
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
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always_latch @(posedge 1'h0) begin : LABEL_0
    id_6 <= 1;
  end
  wire id_8 = (id_7);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_7,
      id_5,
      id_2
  );
  wire id_9;
  wire id_10;
  wire id_11;
  integer id_12;
endmodule
