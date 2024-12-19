// Seed: 3429986227
module module_0 (
    input  wor  id_0,
    output wor  id_1,
    input  wire id_2,
    output tri1 id_3
);
  wire id_5;
  timeunit 1ps;
  assign module_1.type_40 = 0;
  assign id_3 = id_2 - 1;
endmodule
module module_0 (
    input tri id_0,
    input supply0 id_1,
    input wand id_2,
    output wire id_3,
    input supply0 id_4,
    input logic id_5,
    output supply1 id_6,
    input tri0 id_7,
    input tri1 id_8,
    input wand id_9,
    input uwire id_10,
    inout wand id_11,
    input tri0 id_12,
    input uwire id_13,
    input tri id_14,
    output uwire id_15,
    output uwire id_16,
    input wire id_17,
    input wor id_18,
    input uwire id_19,
    input supply1 module_1,
    input logic id_21,
    input wand id_22,
    output logic id_23,
    output wor id_24,
    output logic id_25,
    input supply0 id_26,
    input uwire id_27,
    input supply0 id_28,
    input tri id_29,
    output logic id_30
);
  assign id_6 = 1;
  module_0 modCall_1 (
      id_8,
      id_15,
      id_2,
      id_11
  );
  supply1 id_32 = id_17;
  assign id_16 = id_27;
  always @(1 or negedge 1) begin : LABEL_0
    id_23 <= id_5;
    id_25 <= id_21;
    case (1)
      id_20: id_30 <= 1'b0 - id_18;
      default: begin : LABEL_0
        id_15 = id_19;
      end
    endcase
    #1;
    #1;
    assert (1);
    $display;
  end
  and primCall (
      id_23,
      id_11,
      id_5,
      id_26,
      id_19,
      id_7,
      id_10,
      id_17,
      id_22,
      id_29,
      id_13,
      id_1,
      id_4,
      id_28,
      id_18,
      id_27,
      id_9,
      id_21,
      id_14,
      id_12,
      id_2,
      id_0,
      id_8
  );
  always @(posedge 1 or posedge 1'b0) begin : LABEL_0
    id_25 <= 1;
  end
endmodule
