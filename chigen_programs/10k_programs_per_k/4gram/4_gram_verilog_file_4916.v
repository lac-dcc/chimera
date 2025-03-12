// Seed: 4094493672
module module_0 (
    output uwire id_0,
    output logic id_1,
    output uwire id_2,
    output wor id_3,
    input supply0 id_4,
    input uwire id_5,
    input tri0 id_6,
    output wor id_7,
    input tri0 id_8
    , id_12,
    input tri1 id_9,
    output logic id_10
);
  wor id_13;
  initial begin : LABEL_0
    case (id_12)
      {1'b0, id_6 + 1'h0} : id_10 = 1;
      default: begin : LABEL_1
        id_1 <= id_13;
      end
    endcase
  end
  assign module_1.id_2 = 0;
  assign id_13 = 1;
endmodule
module module_1 (
    inout wand id_0,
    input supply1 id_1,
    output supply1 id_2,
    input wire id_3,
    input uwire id_4,
    output logic id_5,
    input uwire id_6,
    input tri0 id_7,
    input supply1 id_8,
    output wand id_9,
    input tri0 id_10,
    input tri1 id_11,
    output wire id_12,
    input tri1 id_13,
    output tri0 id_14,
    output supply0 id_15,
    output tri1 id_16,
    input tri0 id_17,
    input wor id_18
);
  always @(negedge 1 + 1 - 1'h0) begin : LABEL_0
    id_5 <= id_11;
  end
  module_0 modCall_1 (
      id_0,
      id_5,
      id_12,
      id_9,
      id_1,
      id_3,
      id_4,
      id_9,
      id_18,
      id_3,
      id_5
  );
endmodule
