// Seed: 1813451570
module module_0 #(
    parameter id_16 = 32'd13,
    parameter id_19 = 32'd72
);
  bit
      id_1,
      id_2,
      id_3,
      id_4,
      id_5,
      id_6,
      id_7,
      id_8,
      id_9,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      _id_16,
      id_17,
      id_18,
      _id_19,
      id_20;
  logic [-1 : -1] id_21;
  logic [id_16 : id_19] id_22;
  ;
  assign id_14 = -1;
  always @(posedge id_11) begin : LABEL_0
    if (1) begin : LABEL_1
      id_6 <= "";
    end else begin : LABEL_2
      id_3 <= 1'h0;
    end
  end
endmodule
module module_1 #(
    parameter id_0 = 32'd58,
    parameter id_3 = 32'd17,
    parameter id_5 = 32'd6
) (
    output wor   _id_0,
    output tri   id_1,
    input  uwire id_2,
    inout  wand  _id_3
);
  wire [id_3 : -1] _id_5;
  bufif0 primCall (id_1, id_2, id_6);
  logic [(  id_0  ) : id_3] id_6;
  module_0 modCall_1 ();
  logic [id_5  &  id_3 : 1 'b0] id_7;
endmodule
