// Seed: 2978319568
module module_0 (
    output wor id_0,
    input wire id_1,
    input supply0 id_2,
    input supply0 id_3,
    input supply1 id_4,
    output tri id_5,
    output supply1 id_6,
    input wor id_7,
    output wor id_8,
    input tri0 id_9,
    input tri1 id_10,
    input tri0 id_11,
    output wire id_12,
    input supply0 id_13,
    output tri1 id_14,
    output wand id_15,
    output supply1 id_16,
    output tri1 id_17,
    output tri id_18
);
  uwire id_20;
  assign id_5  = id_4;
  assign id_17 = id_20;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    output supply1 id_2,
    output wand id_3,
    output supply1 id_4,
    input supply0 id_5,
    input wor id_6,
    inout logic id_7,
    input tri id_8,
    output wor id_9,
    input tri1 id_10
);
  assign id_3 = id_5;
  module_0(
      id_2,
      id_6,
      id_1,
      id_8,
      id_8,
      id_2,
      id_4,
      id_8,
      id_3,
      id_10,
      id_10,
      id_8,
      id_9,
      id_0,
      id_4,
      id_9,
      id_3,
      id_3,
      id_4
  );
  tri  id_12 = 1;
  wire id_13;
  reg  id_14 = 1;
  id_15 :
  assert property (@(posedge 1) 1) begin
    if (1'd0 * 1'h0) id_7 <= id_14;
    begin
      id_7 = 1;
    end
  end
endmodule
