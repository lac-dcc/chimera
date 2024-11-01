// Seed: 4278856844
module module_0 (
    input wand id_0,
    input supply0 id_1,
    input wand id_2,
    input wand id_3,
    input wire id_4
    , id_21,
    output wire id_5,
    output tri id_6,
    output supply1 id_7,
    input wand id_8,
    output wand id_9,
    input tri id_10,
    input tri id_11,
    input supply0 id_12,
    input wor id_13,
    output tri id_14,
    output wor id_15,
    input uwire id_16,
    output tri id_17,
    output tri0 id_18,
    input tri1 id_19
);
  id_22 :
  assert property (@(posedge id_16) id_11)
  else $display(1);
  assign id_15 = 1;
  assign id_18 = 1'b0 - (0) ? (1) - 1 : 1 - id_22;
endmodule
module module_1 (
    input  wor   id_0,
    output wor   id_1,
    output uwire id_2
);
  wire id_4;
  module_0(
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0
  );
  wire id_5;
  always_latch @(posedge 1, posedge id_5 && 1) begin
    #(id_0);
    disable id_6;
  end
  wire id_7;
  always @(posedge id_7) begin
    $display(id_7, id_4, id_7);
  end
  tri id_8 = id_0;
  always_comb @(negedge id_4) begin
    $display;
  end
  assign id_2 = id_0;
endmodule
