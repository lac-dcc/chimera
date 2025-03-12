// Seed: 3870066514
module module_0 (
    input  wire  id_0,
    output logic id_1,
    input  wire  id_2
);
  always @(posedge id_2) begin : LABEL_0
    id_1 <= (1'b0);
  end
  assign module_1.id_13 = 0;
endmodule
module module_1 (
    output logic id_0,
    input supply0 id_1,
    output supply1 id_2,
    output supply0 id_3,
    input tri1 id_4,
    output supply1 id_5,
    input tri1 id_6,
    output supply0 id_7,
    output uwire id_8,
    input tri id_9,
    output wor id_10,
    input wand id_11,
    input supply0 id_12,
    input wor id_13,
    input wand id_14,
    input supply1 id_15,
    output tri1 id_16,
    output uwire id_17,
    output supply1 id_18,
    output tri0 id_19,
    input supply0 id_20,
    input wire id_21,
    input tri1 id_22
);
  always_ff @(id_1 or posedge -1'b0, posedge 1)
    if (-1'b0) begin : LABEL_0
      id_0 = -1;
    end
  module_0 modCall_1 (
      id_20,
      id_0,
      id_13
  );
endmodule
