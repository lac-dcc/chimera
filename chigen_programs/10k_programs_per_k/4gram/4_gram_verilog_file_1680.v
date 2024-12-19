// Seed: 1698380175
module module_0 ();
  assign id_1[1] = id_1;
  assign module_2.id_1 = 0;
  assign module_1.id_13 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    output tri1 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wor id_4,
    output tri id_5,
    input tri id_6,
    input wire id_7,
    output uwire id_8,
    input wand id_9,
    output supply1 id_10,
    output wire id_11
);
  assign id_11 = 1;
  wand id_13 = 1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input  logic id_0,
    output logic id_1
);
  always_latch @(1 or posedge 1) begin : LABEL_0
    id_1 <= 1;
  end
  initial
    if (id_0) begin : LABEL_0
      id_1 = id_0;
    end
  module_0 modCall_1 ();
endmodule
