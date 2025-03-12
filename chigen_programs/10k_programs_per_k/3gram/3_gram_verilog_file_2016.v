// Seed: 1275934698
module module_0 (
    output tri1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    output tri0 id_3,
    output supply1 id_4,
    output tri id_5,
    input tri0 id_6,
    input wor id_7,
    input wor id_8,
    output wand id_9,
    input wire id_10,
    output wire id_11,
    input tri0 id_12
);
  logic id_14;
  parameter id_15 = 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    output wor id_2,
    output tri0 id_3,
    output logic id_4,
    input tri0 id_5,
    input wire id_6,
    output supply1 id_7,
    input wand id_8,
    output wor id_9,
    input wor id_10,
    input uwire id_11#(
        .id_13(-1),
        .id_14(1),
        .id_15(1),
        .id_16(1'd0),
        .id_17(-1)
    )
);
  always @(negedge "" or posedge 1) begin : LABEL_0
    id_4 <= id_17;
  end
  parameter id_18 = 1;
  wire id_19;
  logic id_20, id_21;
  final begin : LABEL_1
    #1;
  end
  wire id_22 = id_8;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_1,
      id_2,
      id_9,
      id_2,
      id_0,
      id_11,
      id_8,
      id_9,
      id_0,
      id_7,
      id_10
  );
  parameter id_23 = id_18;
endmodule
