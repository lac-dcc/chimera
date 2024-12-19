// Seed: 4198582245
module module_0 (
    output tri1  id_0,
    input  tri0  id_1,
    output uwire id_2,
    input  wire  id_3,
    input  uwire id_4,
    input  uwire id_5
);
  assign id_2 = id_4;
  assign id_0 = 1'b0;
  tri0 id_7 = 1;
  assign module_1.id_11 = 0;
endmodule
module module_1 (
    input wand id_0,
    output wire id_1,
    input supply1 id_2,
    input uwire id_3,
    output wand id_4,
    output supply0 id_5,
    input wor id_6,
    input logic id_7,
    output logic id_8,
    input supply0 id_9,
    input logic id_10,
    input tri1 id_11,
    output logic id_12,
    output uwire id_13
);
  initial begin : LABEL_0
    if (1'b0) id_8 = 1;
    else id_12 = id_10;
    if (1'b0)
      assert (1);
      else begin : LABEL_0
        id_8 <= id_7;
      end
  end
  assign id_8 = id_10;
  wire id_15;
  final $display;
  wire id_16;
  module_0 modCall_1 (
      id_5,
      id_9,
      id_5,
      id_3,
      id_9,
      id_3
  );
endmodule
