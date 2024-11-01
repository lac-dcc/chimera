// Seed: 2357862024
module module_0 (
    output supply1 id_0
    , id_16,
    output wand id_1,
    input tri1 id_2,
    input supply1 id_3,
    output wand id_4,
    output tri1 id_5,
    input uwire id_6,
    input tri id_7,
    input wor id_8,
    input wand id_9,
    input tri0 id_10,
    output tri id_11,
    output tri0 id_12,
    input tri1 id_13,
    output supply0 id_14
);
  assign id_16 = 1'd0;
  assign id_1  = 'h0;
endmodule
module module_1 (
    input tri0 id_0,
    output logic id_1,
    input wor id_2,
    output logic id_3,
    input logic id_4,
    output logic id_5,
    input logic id_6,
    input supply1 id_7,
    output supply1 id_8,
    input supply0 id_9,
    input logic id_10,
    output logic id_11,
    input supply0 id_12,
    input uwire id_13,
    output supply1 id_14,
    input logic id_15,
    output supply1 id_16,
    input uwire id_17,
    input logic id_18
);
  assign id_3 = id_10;
  always @(id_2) begin
    id_3 <= 1;
    id_5 <= id_7 ? 1 : 1;
    assign id_14 = 1;
    if (1)
      if (id_2) begin
        id_5 <= 1;
      end else begin
        id_11 <= 1'b0;
        id_3 = id_15;
        $display(id_6, id_18);
        id_11 <= 1;
        #1;
        id_5 = 1;
        $display(id_17 - id_9, (id_10 && 1'b0));
        if (1'b0) if (1) for (id_16 = 1'd0 <= 1; id_12 == id_10; id_16 = 1) id_1 <= id_6;
      end
    id_1 = id_4;
  end
  always @(id_10 or negedge 1)
    if (id_2 && id_9) id_5 <= 1;
    else id_16 = 1 != "";
  initial begin
    if (1'b0) begin
      disable id_20;
    end
  end
  module_0(
      id_16, id_8, id_12, id_9, id_14, id_8, id_17, id_9, id_2, id_2, id_9, id_8, id_14, id_7, id_8
  );
endmodule
