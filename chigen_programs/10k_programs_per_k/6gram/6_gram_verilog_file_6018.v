// Seed: 597580479
module module_0 (
    input supply1 id_0,
    input wor module_0,
    input uwire id_2,
    output tri0 id_3
);
  assign id_3 = id_1 ? 1 : {id_2{(1 || -1'b0 ? (1) : -1)}} ? id_2 : 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd39
) (
    input  tri   id_0,
    output wand  id_1,
    input  wand  id_2,
    input  wor   id_3,
    input  wand  _id_4,
    output logic id_5
);
  reg id_7;
  assign id_5 = 1;
  logic [id_4 : 1] id_8;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.id_2 = 0;
  assign id_1 = -1 == 1;
  generate
    for (id_9 = -1'b0; id_8 == id_7; id_9 = id_4) begin : LABEL_0
      initial begin : LABEL_1
        id_7 <= 1'b0;
        id_8 <= 1'h0;
        id_5 <= id_9;
      end
      for (id_10 = id_2; id_0; id_8 = id_2) begin : LABEL_2
        always @(posedge id_10) begin : LABEL_3
          $clog2(9);
          ;
          id_5 <= ({id_7, 1'b0} && -1 == id_2) == id_9;
        end
      end
    end
  endgenerate
  assign id_7 = id_9;
endmodule
