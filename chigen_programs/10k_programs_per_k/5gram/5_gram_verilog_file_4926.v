// Seed: 77805840
module module_0 (
    input supply1 id_0,
    output uwire id_1,
    output supply1 id_2,
    output supply0 id_3,
    input supply0 id_4,
    input wire id_5,
    input tri1 id_6,
    input supply0 id_7,
    output wire id_8,
    input wand id_9,
    input tri1 id_10,
    input uwire id_11,
    input wire id_12,
    input uwire id_13,
    output wand id_14,
    output wor id_15
);
endmodule
module module_1 (
    input wor id_0,
    input tri id_1,
    output tri1 id_2,
    input supply1 id_3,
    input tri1 id_4,
    input uwire id_5,
    input supply1 id_6,
    inout tri1 id_7,
    input tri1 id_8,
    input supply0 id_9,
    input wand id_10,
    input uwire id_11,
    input supply0 id_12,
    output wire id_13,
    input tri0 id_14
    , id_19,
    input tri id_15,
    output logic id_16,
    output tri1 id_17
);
  generate
    if (1) begin : LABEL_0
      logic id_20;
      ;
    end else begin : LABEL_1
      always @(-1 or posedge (id_12) > id_12) begin : LABEL_2
        id_16 <= id_6;
      end
    end
  endgenerate
  logic id_21, id_22;
  module_0 modCall_1 (
      id_0,
      id_13,
      id_7,
      id_2,
      id_3,
      id_3,
      id_14,
      id_12,
      id_13,
      id_10,
      id_12,
      id_12,
      id_9,
      id_4,
      id_13,
      id_7
  );
  assign modCall_1.id_5 = 0;
endmodule
