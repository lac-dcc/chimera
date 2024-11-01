// Seed: 2703321042
program module_0 (
    output tri0 id_0,
    output wor  id_1,
    output tri0 id_2,
    input  tri0 id_3,
    input  wand id_4
);
  assign id_0 = id_4;
  assign id_1 = id_3;
  assign id_2 = 1'b0;
endprogram
module module_1 (
    input  tri0  id_0,
    output wire  id_1,
    input  wand  id_2,
    input  tri   id_3,
    input  wand  id_4,
    input  wand  id_5,
    output wand  id_6,
    input  wor   id_7,
    input  wand  id_8,
    input  tri   id_9,
    input  uwire id_10,
    input  wor   id_11,
    output logic id_12,
    input  logic id_13,
    input  logic id_14,
    output logic id_15,
    output logic id_16,
    input  wire  id_17
    , id_20,
    input  wor   id_18
);
  logic id_21;
  reg   id_22;
  assign id_12 = id_20;
  assign id_16 = id_21;
  always begin
    @(negedge 1'd0)
    @(1'b0 or posedge 1 or id_20)
    @(posedge (1'b0) or posedge id_14) begin
      id_22 <= id_15++;
    end
    id_15 = id_14;
    id_22 = 1;
    id_20 <= id_13;
    for (id_16 = id_21; id_22; id_1 = 1) id_20 = id_21;
  end
  assign id_21 = 1;
  module_0(
      id_1, id_6, id_1, id_2, id_9
  );
  wire id_23;
endmodule
