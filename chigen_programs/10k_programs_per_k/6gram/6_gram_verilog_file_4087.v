// Seed: 3696329758
module module_0 #(
    parameter id_1 = 32'd54,
    parameter id_2 = 32'd4
);
  localparam id_1 = 1;
  wire _id_2;
  assign module_1.id_6 = 0;
  wor [-1  <<  id_2  -  -1 : -1  <  id_1] id_3, id_4, id_5;
  assign id_5 = id_1 - id_3;
endmodule
module module_1 (
    input  tri   id_0
    , id_9,
    output uwire id_1,
    input  wor   id_2,
    input  wand  id_3,
    output logic id_4,
    input  uwire id_5,
    input  wand  id_6,
    output wor   id_7
);
  always @(id_3 or posedge id_5) begin : LABEL_0
    id_4 <= -1 === id_5;
    id_4 <= 1;
  end
  assign {id_5 ^ 1, {id_2, 1'b0}} = id_3;
  module_0 modCall_1 ();
endmodule
