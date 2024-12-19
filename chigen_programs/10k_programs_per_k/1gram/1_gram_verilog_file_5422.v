// Seed: 2944174193
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = id_4;
  assign id_4 = 1;
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
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always id_6 <= id_1;
  if (id_1) always_latch @(posedge 1) $display;
  else
    module_0 modCall_1 (
        id_8,
        id_7,
        id_5,
        id_2,
        id_7,
        id_5
    );
  wire id_9, id_10;
  tri1 id_11 = 1'b0;
  id_12(
      1'b0
  );
endmodule
