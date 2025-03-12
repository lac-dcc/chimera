// Seed: 210325097
module module_0 ();
  wire id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd76,
    parameter id_5 = 32'd9
) (
    output wire  id_0,
    input  tri0  _id_1,
    input  wire  id_2,
    output logic id_3,
    output logic id_4,
    input  tri   _id_5,
    input  tri   id_6
);
  bit [id_1 : 1] id_8 = -1;
  module_0 modCall_1 ();
  always @(posedge -1'b0 or posedge id_2) begin : LABEL_0
    fork
      id_8 <= 1;
      id_4 <= 1;
      id_3 <= id_8;
    join
  end
  wor [id_5 : 1] id_9 = 1;
endmodule
