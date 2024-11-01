// Seed: 91272279
module module_0 (
    input wand id_0,
    input wand id_1,
    output tri0 void id_2,
    input wire id_3,
    output wor id_4,
    output wand id_5,
    input tri id_6,
    input tri id_7,
    output wand id_8,
    input wand id_9,
    output wire id_10,
    output wor id_11,
    input supply1 id_12
);
  id_14(
      1 - id_7, 1, !id_11, 1, 1
  );
  wire id_15, id_16, id_17;
endmodule
module module_1 (
    output logic id_0,
    input  wire  id_1
);
  supply1 id_3 = id_1;
  always_latch
    if (id_1)
      case (id_3)
        default: id_0 <= 1;
      endcase
    else id_0 = 1;
  module_0(
      id_3, id_1, id_3, id_1, id_3, id_3, id_3, id_3, id_3, id_3, id_3, id_3, id_1
  );
  always id_0 <= 1'd0;
  wire id_4;
  initial id_0 = 1'b0;
  assign id_0 = 1;
endmodule
