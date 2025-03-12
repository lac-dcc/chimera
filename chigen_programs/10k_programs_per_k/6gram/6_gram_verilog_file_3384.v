// Seed: 1752705160
module module_0 (
    output tri0  id_0,
    output uwire id_1,
    input  tri1  id_2,
    output wor   id_3
    , id_9,
    input  tri   id_4,
    input  tri1  id_5,
    output logic id_6,
    output tri1  id_7
);
  always @(*) begin : LABEL_0
    $clog2(12);
    ;
    if (-1 && 1) begin : LABEL_1
      id_6 = 1;
    end
  end
endmodule
module module_1 #(
    parameter id_6 = 32'd74
) (
    input supply0 id_0,
    output uwire id_1,
    input wire id_2,
    output uwire id_3
    , id_23,
    input uwire id_4,
    input wand id_5,
    input tri _id_6,
    output logic id_7,
    input wand id_8,
    output logic id_9,
    input tri1 id_10,
    input wire id_11,
    input uwire id_12,
    input supply0 id_13,
    output uwire id_14,
    input uwire id_15,
    output tri id_16,
    input wire id_17,
    output logic id_18,
    input wand id_19,
    input wand id_20,
    input uwire id_21
    , id_24
);
  wire [id_6  <  -1 : 1] id_25;
  parameter id_26 = 1;
  wire id_27;
  module_0 modCall_1 (
      id_14,
      id_1,
      id_4,
      id_16,
      id_8,
      id_2,
      id_7,
      id_16
  );
  assign modCall_1.id_0 = 0;
  wire id_28;
  initial begin : LABEL_0
    id_18 <= 1'h0;
    id_24 = #1  ~id_27;
  end
  always @(posedge -1) begin : LABEL_1
    if (-1) begin : LABEL_2
      id_7 <= 1'h0 == id_23 ? 1 - id_19 : -id_27;
      id_9 <= id_6;
      if (1 && 1) disable id_29;
    end else id_9 <= (id_0);
  end
endmodule
