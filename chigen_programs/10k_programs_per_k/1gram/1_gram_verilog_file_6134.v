// Seed: 716998596
module module_0 (
    input tri id_0,
    input supply1 id_1
);
  assign module_2.id_5 = 0;
endmodule
module module_1 (
    input wire id_0
);
  reg id_2 = ~id_0;
  always id_2 <= 1;
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_0
  );
endmodule
module module_2 (
    output wire id_0,
    output wire id_1,
    input tri0 id_2,
    input tri1 id_3,
    input logic id_4,
    input uwire id_5,
    output logic id_6,
    output logic id_7,
    input wand id_8,
    input logic id_9,
    output logic id_10,
    output tri0 id_11,
    output supply0 id_12
);
  logic [7:0] id_14;
  assign id_6 = id_4;
  always
    if (id_8) id_12 = 1;
    else $display(id_8, 1, id_5 - id_4);
  module_0 modCall_1 (
      id_8,
      id_8
  );
  reg id_15;
  assign id_7 = id_14[1 : 1'd0];
  wire id_16;
  assign id_7 = id_4;
  wire id_17, id_18;
  always id_10 <= id_15;
  assign id_11 = 1'd0;
  always_latch begin : LABEL_0
    id_7 <= id_9;
    if (id_2) $display(id_3, 1'h0 & 1);
  end
  wire id_19;
  timeunit 1ps;
endmodule
