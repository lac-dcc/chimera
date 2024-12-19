// Seed: 1793785255
module module_0;
  wire id_1;
  reg id_4;
  logic [7:0] id_5;
  assign module_1.id_1 = 0;
  final begin : LABEL_0
    force id_1 = 1;
  end
  wire id_6;
  assign id_5[1] = id_1;
  always @id_7 begin : LABEL_0
    id_4 <= id_4;
  end
endmodule
module module_1 (
    output wire id_0,
    output wand id_1,
    input tri0 id_2,
    output wand id_3,
    output tri1 id_4,
    input tri0 id_5,
    input wand id_6,
    input wire id_7,
    input tri0 id_8,
    inout tri0 id_9,
    input supply0 id_10,
    output logic id_11,
    output logic id_12,
    input uwire id_13,
    input wire id_14
);
  wire id_16;
  wor  id_17;
  assign id_11 = (1) ? 1 : 1'h0;
  module_0 modCall_1 ();
  always_ff @(1'b0) begin : LABEL_0
    id_12 <= ~id_13;
    if ({id_13}) begin : LABEL_0
      if (1) id_17 = id_9;
      else begin : LABEL_0
        wait (id_9);
        id_11 <= (1);
        if (id_17) begin : LABEL_0
          deassign id_17.id_2;
        end else id_11 <= 1;
      end
    end
  end
endmodule
