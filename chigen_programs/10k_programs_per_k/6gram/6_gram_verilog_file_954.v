// Seed: 3736390897
module module_0;
  always @(posedge 1) begin : LABEL_0
    disable id_1;
  end
endmodule
module module_1 (
    input tri id_0,
    input logic id_1
    , id_28,
    output logic id_2,
    input logic id_3,
    input tri1 id_4,
    input logic id_5,
    input logic id_6,
    output wand id_7,
    input supply0 id_8,
    input wand id_9,
    input wor id_10,
    input wire id_11,
    output logic id_12,
    input logic id_13,
    output logic id_14,
    input supply1 id_15,
    input tri1 id_16,
    input wire id_17,
    input wire id_18,
    input supply1 id_19,
    input tri id_20,
    input tri id_21,
    input supply0 id_22,
    output logic id_23,
    input uwire id_24,
    input uwire id_25,
    output logic id_26
);
  assign id_12 = id_5;
  wire  id_29;
  uwire id_30;
  assign id_2 = id_13;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_31;
  always @(posedge 1 + id_1 or negedge 1) begin : LABEL_0
    id_26 = 1;
  end
  assign id_30 = 1;
  initial begin : LABEL_0
    {id_18} += 1;
    #1 id_23 = id_3;
    id_26 = id_5;
    id_2 <= id_3;
    id_2 = 1'b0;
    if (id_21) begin : LABEL_0
      id_2 = id_6;
    end else begin : LABEL_0
      id_14 <= #1 id_1;
      id_26 <= 1;
    end
  end
endmodule
