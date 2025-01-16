// Seed: 1174055027
module module_0 (
    output tri id_0,
    output uwire id_1,
    input uwire id_2,
    output tri id_3,
    id_12,
    output tri0 id_4,
    input tri1 id_5,
    input tri0 id_6,
    input tri0 id_7,
    id_13,
    input wire id_8,
    output supply1 id_9,
    output supply1 id_10
);
  wire id_14, id_15, id_16, id_17, id_18, id_19;
  wire id_20, id_21;
  task id_22;
    input id_23;
    input id_24 = -1;
  endtask
  wire id_25, id_26;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input tri id_1,
    output wand id_2,
    input logic id_3,
    output supply1 id_4,
    input supply0 id_5,
    id_13,
    output tri1 id_6,
    output logic id_7,
    output wire id_8,
    input wire id_9,
    input supply1 id_10,
    input tri id_11
);
  assign id_6 = 1 - id_3;
  assign id_4 = 1'd0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_4,
      id_2,
      id_9,
      id_9,
      id_10,
      id_10,
      id_8,
      id_2
  );
  id_14(
      .id_0(-1), .id_1(id_10)
  );
  always_latch id_7 <= id_3;
endmodule
