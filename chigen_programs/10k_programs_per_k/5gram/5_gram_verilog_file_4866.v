// Seed: 2509501909
module module_0 (
    input wor   id_0,
    input tri1  id_1,
    input wor   id_2,
    input uwire id_3,
    input tri0  module_0
);
  bit id_6, id_7;
  always_comb @(posedge {id_6{id_2}})
    if (1) begin : LABEL_0
      id_7 = 1'b0;
    end else disable id_8;
  initial begin : LABEL_1
    id_8 <= -1;
  end
  assign module_1.id_3 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd41
) (
    output tri1  id_0,
    input  tri   id_1,
    output wand  id_2,
    output logic id_3
);
  logic [7:0] id_5;
  _id_6 :
  assert property (@(posedge -1) id_5)
  else $clog2(13);
  ;
  always @(1'h0 or posedge !id_1) begin : LABEL_0
    id_3 <= id_5[id_6];
  end
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  logic id_8;
  ;
endmodule
