// Seed: 2037636938
module module_0 (
    input logic id_0,
    output wand id_1,
    input supply0 id_2,
    input supply1 id_3,
    output supply0 id_4,
    input tri1 id_5,
    output wand id_6,
    output logic id_7,
    output tri1 id_8,
    output tri0 id_9,
    output tri id_10
    , id_12
);
  initial begin : LABEL_0
    if (1'b0) #(1) id_7 <= #id_3 id_0;
    else id_4 = 1;
  end
endmodule
module module_1 (
    input tri1 id_0,
    output wor id_1,
    output logic id_2,
    output uwire id_3,
    input wand id_4,
    output wire id_5,
    output wire id_6,
    input wor id_7,
    input wand id_8,
    input wire id_9,
    output supply1 id_10,
    input wor id_11,
    output logic id_12,
    input logic id_13,
    input tri0 id_14,
    inout tri1 id_15
);
  always @(1 or posedge id_4) begin : LABEL_0
    case (1)
      1: id_12 = 1'b0;
      id_0: begin : LABEL_0
        id_2 <= 1'b0;
      end
      1: id_1 = 1;
      id_8: id_12 <= id_13;
      default: id_15 = id_8;
    endcase
  end
  module_0 modCall_1 (
      id_13,
      id_10,
      id_14,
      id_8,
      id_1,
      id_7,
      id_5,
      id_12,
      id_5,
      id_15,
      id_3
  );
  assign modCall_1.id_10 = 0;
endmodule
