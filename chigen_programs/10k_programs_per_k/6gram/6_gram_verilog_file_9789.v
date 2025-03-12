// Seed: 2934924287
macromodule module_0 (
    output tri0 id_0,
    input  wor  id_1,
    input  wand id_2
);
  logic id_4 = 1 - id_2;
endmodule
module module_1 #(
    parameter id_0 = 32'd69,
    parameter id_2 = 32'd82
) (
    input tri1 _id_0,
    input wand id_1,
    input uwire _id_2,
    input wor id_3,
    input supply0 id_4,
    output wire id_5,
    output tri0 id_6,
    input supply1 id_7,
    input uwire id_8,
    output tri1 id_9
);
  assign id_9 = 1'b0;
  supply1 id_11;
  assign id_11 = -1;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_1
  );
  assign id_9 = -1;
  logic id_12, id_13, id_14, id_15;
  logic [7:0] id_16;
  logic id_17;
  assign id_17 = id_16;
  localparam id_18 = -1'b0;
  logic [id_0 : -1 'h0] id_19 = id_2;
  always begin : LABEL_0
    id_16[id_2 : 1] = id_1;
  end
  wire id_20 = id_8;
endmodule
