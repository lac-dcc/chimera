// Seed: 1472024551
module module_0;
  assign module_3.id_11 = 0;
  assign module_2.id_1  = 0;
endmodule
module module_1 (
    output uwire id_0,
    output wand id_1,
    input supply0 id_2,
    input tri1 id_3,
    output wire id_4,
    output supply1 id_5
);
  assign id_5 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1
);
  output wire id_1;
  assign id_1 = 1'h0;
  module_0 modCall_1 ();
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  final begin : LABEL_0
    #1;
  end
  wire id_14;
  always_latch @(negedge id_7)
    if (id_10) begin : LABEL_0
      id_1 = id_14;
    end
  module_0 modCall_1 ();
  wire id_15;
  id_16(
      .id_0(1),
      .id_1(id_13),
      .id_2(1),
      .id_3(1),
      .id_4(id_12),
      .id_5(1'b0),
      .id_6(1),
      .id_7(1'h0),
      .id_8(id_3)
  );
  assign id_11 = (id_10);
endmodule
