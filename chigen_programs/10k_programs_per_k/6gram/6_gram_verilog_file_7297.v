// Seed: 2636436251
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    input tri id_2,
    input tri0 id_3,
    input uwire id_4,
    input uwire id_5,
    input tri1 id_6,
    input wire id_7,
    input tri1 id_8,
    input uwire id_9,
    input uwire id_10,
    input wand id_11,
    input wor id_12,
    input supply1 id_13,
    output tri0 id_14,
    input supply0 id_15,
    output tri id_16
);
endmodule
module module_1 #(
    parameter id_3 = 32'd44,
    parameter id_6 = 32'd94
) (
    input  tri1  id_0,
    output wor   id_1,
    output logic id_2,
    input  wand  _id_3,
    output tri1  id_4,
    input  wire  id_5,
    input  wor   _id_6,
    input  tri   id_7
);
  wire [id_6 : id_3] id_9 = ~id_7;
  assign id_9 = ~id_9;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_7,
      id_0,
      id_7,
      id_0,
      id_7,
      id_0,
      id_0,
      id_7,
      id_0,
      id_5,
      id_5,
      id_0,
      id_1,
      id_7,
      id_1
  );
  wire [1 : -1] id_10 = id_7;
  and primCall (id_1, id_9, id_0, id_7, id_5);
  always @(posedge ~id_6)
    if (-1) begin : LABEL_0
      id_2 = -1 == -1;
    end
endmodule
