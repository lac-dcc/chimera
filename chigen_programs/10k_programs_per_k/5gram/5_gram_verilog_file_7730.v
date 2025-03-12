// Seed: 775699409
module module_0 (
    output logic module_0,
    input uwire id_1,
    output uwire id_2,
    input tri1 id_3,
    output wand id_4,
    input wire id_5,
    input supply1 id_6,
    input wand id_7,
    input wor id_8,
    output uwire id_9,
    input tri id_10,
    input wand id_11
);
  always @(posedge 1) begin : LABEL_0
    if (1 + -1) id_0 <= id_1 * id_3;
  end
  logic [-1 'h0 : -1] id_13;
  ;
  wire id_14;
  parameter id_15 = -1;
  final $clog2(74);
  ;
endmodule
module module_1 (
    output wor id_0,
    input wire id_1,
    output supply1 id_2,
    output supply1 id_3,
    output wand id_4
    , id_7,
    output logic id_5
);
  always @(negedge ~id_7 - -1'b0) begin : LABEL_0
    id_5 = #id_8 -1'h0 - id_7;
    if (1)
      if (1) begin : LABEL_1
        disable id_9;
      end else id_5 <= -1'b0;
  end
  wire id_10;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_4,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_5 = 0;
  generate
    assign id_5 = -1;
  endgenerate
  supply1 id_11;
  wire id_12;
  logic id_13, id_14;
  wire [-1 : 1] id_15;
  assign id_2 = id_7 - -1;
endmodule
