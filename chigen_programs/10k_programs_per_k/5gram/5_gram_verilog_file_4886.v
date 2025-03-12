// Seed: 1924780139
module module_0 (
    output wand id_0,
    input tri1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri1 id_4,
    input wor id_5,
    output supply1 id_6
    , id_9, id_10,
    input wire id_7
);
  assign id_9 = id_2;
endmodule
module module_1 #(
    parameter id_13 = 32'd67,
    parameter id_4  = 32'd34,
    parameter id_9  = 32'd64
) (
    input wand id_0,
    output supply1 id_1,
    output wor id_2,
    output wor id_3
    , _id_9,
    input wor _id_4,
    input uwire id_5,
    output supply1 id_6,
    input tri1 id_7
);
  wire id_10;
  ;
  logic [1 : id_4] id_11[-1 : -1] = 1;
  wire [-1  |  1 : -1] id_12;
  parameter id_13 = 1'b0;
  always @(posedge id_9 * -1'b0) begin : LABEL_0
    if (-1'h0) begin : LABEL_1
      id_11 <= 1;
    end
  end
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_7,
      id_5,
      id_7,
      id_6,
      id_0
  );
  assign id_2  = id_0;
  assign id_6  = !id_11;
  assign id_11 = id_9 - id_11;
  logic [7:0][(  id_13  ) : id_13] id_14;
  assign id_14[id_9] = id_10;
endmodule
