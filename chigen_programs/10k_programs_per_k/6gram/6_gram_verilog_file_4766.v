// Seed: 3301649279
module module_0 (
    input tri1 id_0,
    output wand id_1,
    input supply1 id_2,
    input uwire id_3,
    input tri0 id_4,
    output tri1 id_5
);
  logic [7:0] id_7;
  tri1 id_8 = 1;
  always @(1'b0) $display(1, 1);
  uwire id_9;
  generate
    if (id_3) begin : LABEL_0
      assign id_9 = 1;
    end else begin : LABEL_0
      always @(posedge id_7[1] or 1) id_8 = 1'b0;
    end
  endgenerate
endmodule
module module_1 (
    input supply0 id_0,
    input tri id_1,
    input wor id_2,
    input wor id_3,
    input supply1 id_4,
    output logic id_5,
    input logic id_6,
    input tri0 id_7,
    input tri0 id_8,
    input tri0 id_9,
    output wire id_10,
    input logic id_11,
    output logic id_12,
    input supply1 id_13,
    input supply1 id_14
    , id_20,
    input supply0 id_15,
    input tri1 id_16,
    input uwire id_17,
    input logic id_18
);
  always @(negedge id_14 == id_13 <= id_8) begin : LABEL_0
    id_12 = id_11;
    id_20 <= id_6;
    case (id_18)
      id_20: begin : LABEL_0
        if (1) $display(1 % "" == id_14);
      end
      1: id_5 = id_18;
      1: begin : LABEL_0
        id_12 <= id_18;
      end
      default: id_10 = id_3;
    endcase
  end
  module_0 modCall_1 (
      id_15,
      id_10,
      id_15,
      id_4,
      id_4,
      id_10
  );
endmodule
