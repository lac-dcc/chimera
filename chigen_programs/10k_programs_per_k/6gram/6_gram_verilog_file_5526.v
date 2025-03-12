// Seed: 3777136846
module module_0 (
    input wire id_0
    , id_8,
    input wand id_1,
    input wand id_2,
    input supply1 id_3,
    input wand id_4,
    input tri id_5,
    output tri1 id_6
);
  wire id_9;
  wire id_10;
  parameter id_11 = 1'd0;
endmodule
module module_1 #(
    parameter id_15 = 32'd27,
    parameter id_6  = 32'd4
) (
    output tri1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input tri id_3,
    output tri0 id_4
);
  assign id_0 = -1'b0;
  wire _id_6, id_7;
  bit id_8, id_9, id_10, id_11, id_12, id_13, id_14, _id_15, id_16, id_17, id_18, id_19;
  assign id_4 = -1 ? 1 : id_14;
  wire id_20;
  ;
  wire [id_15 : id_6] id_21;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_3,
      id_1,
      id_2,
      id_4
  );
  always @(-1) begin : LABEL_0
    if (1 + 1)
      assume (id_14);
      else begin : LABEL_1
        id_19 <= (1 | id_7);
      end
  end
  xnor primCall (
      id_4, id_19, id_12, id_11, id_13, id_1, id_2, id_17, id_14, id_3, id_20, id_9, id_16, id_8
  );
endmodule
