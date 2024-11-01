// Seed: 1248764380
module module_0 ();
  always @(1) begin
    $display(1);
  end
endmodule
module module_1 (
    output tri0 id_0,
    output tri1 id_1,
    input supply1 module_1,
    output wand id_3,
    input tri1 id_4,
    input tri id_5,
    input uwire id_6,
    output logic id_7,
    output wor id_8,
    input wor id_9,
    input wire id_10,
    input tri0 id_11,
    input tri id_12,
    output wand id_13,
    input wand id_14,
    input logic id_15,
    input logic id_16,
    output logic id_17,
    input wand id_18
);
  logic id_20;
  final begin
    id_17 <= #1 id_16;
    case (1'b0)
      'h0:
      if (1)
        if (id_4) $display;
        else begin
          if (id_6) begin
            id_7 <= #1 1'h0;
          end
        end
      1: id_20 = id_16;
      id_15: ;
    endcase
  end
  uwire id_21 = id_4;
  module_0();
  wire  id_22;
  assign id_13 = 1 & id_21;
endmodule
