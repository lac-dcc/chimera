// Seed: 1890357735
module module_0 (
    input  wand id_0,
    output wire id_1
);
  wand id_3 = id_0;
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    output logic id_0,
    input  uwire id_1,
    input  tri0  id_2,
    output logic id_3,
    input  wor   id_4,
    output logic id_5,
    output logic id_6,
    input  tri   id_7,
    output wor   id_8,
    input  wor   id_9,
    input  uwire id_10,
    input  logic id_11,
    output logic id_12,
    input  wire  id_13,
    input  logic id_14
);
  reg id_16 = 1, id_17;
  assign id_0 = 1;
  initial begin
    id_3  <= 1;
    id_16 <= 1'b0 & 1 & 1 & 1;
  end
  assign id_3 = id_14;
  module_0(
      id_4, id_8
  );
  always @(*) begin
    #1;
    id_12 <= (id_11);
    #1
    if (id_7) disable id_18;
    else id_6 = ~id_7;
    id_5 <= 1'b0;
    if (id_18)
      if (1'h0) begin
        wait (1'd0);
        id_0 <= 1;
        id_6 <= id_18;
      end
  end
endmodule
