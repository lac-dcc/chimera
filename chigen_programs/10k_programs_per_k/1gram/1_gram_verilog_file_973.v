// Seed: 3082910040
module module_0 (
    output tri1 id_0,
    output tri1 id_1
);
  logic id_3;
  always this <= -1;
endmodule
module module_1 #(
    parameter id_12 = 32'd11,
    parameter id_14 = 32'd40
) (
    output tri1 id_0,
    output uwire id_1,
    input tri0 id_2,
    output wor id_3,
    input supply0 id_4,
    input wire id_5,
    input wand id_6,
    input supply0 id_7,
    input supply1 id_8,
    input uwire id_9,
    input wand id_10,
    input wor id_11,
    input tri0 _id_12,
    input wand id_13,
    input tri0 _id_14,
    output uwire id_15
);
  logic [7:0] id_17, id_18, id_19;
  assign id_1 = id_6;
  wire [1  *  id_14 : id_12] id_20;
  assign {-1'h0, 1'b0, id_9, -1, 1'b0} = -1;
  parameter id_21 = -1'd0 - 1;
  and primCall (
      id_1,
      id_11,
      id_17,
      id_22,
      id_7,
      id_20,
      id_19,
      id_5,
      id_10,
      id_8,
      id_21,
      id_13,
      id_18,
      id_2,
      id_6,
      id_9,
      id_4
  );
  logic [7:0][-1] id_22;
  assign id_19[1] = 1;
  module_0 modCall_1 (
      id_0,
      id_1
  );
endmodule
