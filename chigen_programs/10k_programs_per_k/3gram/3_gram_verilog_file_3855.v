// Seed: 346806615
module module_0 (
    input tri1 id_0,
    output wire id_1,
    input tri id_2,
    input wand id_3,
    output wire id_4,
    output supply0 id_5,
    input supply0 id_6,
    input supply1 id_7
);
  initial begin : LABEL_0
    cover (-1);
  end
  assign id_1 = id_7;
  wire id_9;
  genvar id_10;
  parameter id_11 = "";
endmodule
module module_1 #(
    parameter id_6 = 32'd5
) (
    output logic id_0,
    input  wand  id_1,
    input  tri0  id_2,
    output logic id_3,
    output tri   id_4
);
  always_comb @(negedge 1'h0 or posedge id_2) id_0 <= id_2;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_2,
      id_1,
      id_4,
      id_4,
      id_2,
      id_1
  );
  wire  _id_6;
  logic id_7;
  ;
  always_comb @(posedge id_7[{-1, id_6}]) id_3 <= 1;
endmodule
