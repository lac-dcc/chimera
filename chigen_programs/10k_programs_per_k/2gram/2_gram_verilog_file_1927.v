// Seed: 3589046469
module module_0 (
    output logic id_0,
    input supply0 id_1,
    output tri1 id_2,
    input tri0 id_3,
    input wire id_4,
    input supply0 id_5,
    output tri id_6,
    input tri0 id_7,
    input supply1 id_8#(-1),
    input tri1 id_9,
    input wand id_10,
    output logic id_11,
    input wand id_12,
    output wire id_13,
    output tri id_14
);
  wire id_16;
  assign module_1.id_22 = 0;
  always begin : LABEL_0
    if (1)
      fork
        id_0 <= -1'b0;
      join_none
    else
      @(posedge id_10) begin : LABEL_1
        id_11 <= -1;
      end
  end
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    output logic id_2,
    input tri id_3,
    input supply1 id_4,
    input supply1 id_5,
    output tri0 id_6,
    output tri0 id_7,
    input wire id_8,
    output supply1 id_9,
    input wand id_10,
    output uwire id_11,
    input tri1 id_12,
    input tri1 id_13,
    input tri0 id_14,
    input supply1 id_15,
    input wor id_16,
    input wand id_17,
    input tri1 id_18,
    input wor id_19,
    input tri0 id_20,
    output uwire id_21,
    input wand id_22
);
  logic id_24;
  ;
  final begin : LABEL_0
    id_2 <= id_15;
  end
  module_0 modCall_1 (
      id_2,
      id_18,
      id_7,
      id_13,
      id_16,
      id_16,
      id_11,
      id_20,
      id_22,
      id_15,
      id_22,
      id_2,
      id_22,
      id_11,
      id_6
  );
  assign id_24 = 1'h0 - id_10;
endmodule
