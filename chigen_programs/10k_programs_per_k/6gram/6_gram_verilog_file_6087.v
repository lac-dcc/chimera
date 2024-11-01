// Seed: 3403266854
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input tri1 id_2,
    input wor id_3,
    input wire id_4,
    output wand id_5,
    output tri0 id_6,
    input wand id_7,
    output uwire id_8,
    input tri id_9,
    output tri0 id_10,
    output tri id_11
);
  logic [7:0] id_13;
  assign id_13[1'b0] = 1;
  wire id_14 = id_14;
endmodule
module module_1 (
    input tri0 id_0,
    output wire id_1
    , id_15,
    output wire id_2,
    input supply1 id_3,
    input tri0 id_4,
    input wor id_5,
    input uwire id_6,
    input logic id_7,
    input tri0 id_8,
    input supply1 id_9,
    input tri id_10,
    input tri1 id_11,
    output wire id_12,
    output uwire id_13
);
  module_0(
      id_8, id_11, id_4, id_4, id_9, id_2, id_2, id_4, id_1, id_5, id_1, id_2
  );
  assign id_2 = id_11;
  logic [7:0] id_16;
  assign id_16[1] = (id_8 ? 1 : (1));
  always @(posedge 1 + id_0 or posedge 1) begin
    wait (1'b0);
    fork
      #1;
      id_17;
      repeat (id_3) id_17 = #1 id_7;
    join
  end
endmodule
