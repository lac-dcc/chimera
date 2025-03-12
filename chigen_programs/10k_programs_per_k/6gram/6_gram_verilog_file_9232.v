// Seed: 697093623
module module_0 (
    input tri0 id_0,
    output wand id_1,
    output wire id_2,
    output logic id_3,
    input supply1 id_4,
    output supply0 id_5
);
  always @*
    if (1 && 1 && 1 - -1'b0) begin : LABEL_0
      id_3 <= -1;
    end
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_16 = 32'd65,
    parameter id_17 = 32'd11
) (
    output supply1 id_0,
    output logic id_1,
    input tri0 id_2,
    output logic id_3,
    input tri0 id_4,
    output wor id_5,
    input wire id_6,
    input tri1 id_7,
    output wand id_8,
    output logic id_9,
    output wor id_10,
    input uwire id_11,
    input tri0 id_12,
    input wor id_13,
    input supply0 id_14,
    output logic id_15,
    input uwire _id_16,
    input supply1 _id_17,
    input supply0 id_18,
    input supply1 id_19
);
  logic [id_17 : 1] id_21;
  ;
  always @(posedge id_18)
    if (1) id_1 <= id_4;
    else begin : LABEL_0
      if (1) begin : LABEL_1
        deassign id_9;
      end else begin : LABEL_2
        if (-1) id_21 <= #1 -1;
        else begin : LABEL_3
          id_1 = -1'h0;
        end
      end
    end
  assign id_21 = id_18;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_8,
      id_9,
      id_4,
      id_8
  );
  logic [id_16 : 1] id_22;
  assign id_21 = id_19 == id_4;
  logic id_23;
  always
    case (id_21)
      id_17: id_15 = -1 == id_13;
      id_19: id_3 <= id_2;
      -1: id_9 <= -1;
      -1: id_22 = -1;
      default: id_22 = id_14;
    endcase
endmodule
