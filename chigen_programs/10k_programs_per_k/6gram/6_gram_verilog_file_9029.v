// Seed: 3610576291
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input wand id_2
    , id_12,
    output tri0 id_3,
    input tri0 id_4,
    output wor id_5,
    output uwire id_6,
    input wand id_7,
    output tri1 id_8,
    output wire id_9,
    input supply0 id_10
);
  logic [1 : -1 'b0] id_13;
  assign id_8 = id_4 ? id_2 : -1 == id_2(id_10);
  localparam id_14 = 1;
  generate
    for (id_15 = id_15; id_12; id_12 = id_10 - (id_13(id_1, id_0, 1'b0 & id_15))) begin : LABEL_0
      always @(posedge 1) begin : LABEL_1
        id_13 <= -1;
      end
    end
  endgenerate
endmodule
module module_1 #(
    parameter id_3 = 32'd56,
    parameter id_5 = 32'd1
) (
    output tri id_0,
    input wor id_1,
    input supply1 id_2,
    output tri _id_3
);
  wire  _id_5;
  uwire id_6 = 1;
  assign id_3 = id_5;
  logic [-1 : id_3] id_7;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1
  );
  reg [id_5 : -1  ==  id_5] id_8;
  always @(negedge -1) begin : LABEL_0
    id_8 <= id_1;
  end
endmodule
