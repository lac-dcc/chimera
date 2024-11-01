// Seed: 1917978817
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input supply1 id_2,
    input logic id_3
);
  logic id_5;
  assign id_5 = id_3;
  always @(posedge 1'h0 or posedge 1) begin
    id_5 <= id_5;
  end
endmodule
module module_1 (
    output wire  id_0,
    input  wor   id_1,
    input  wand  id_2,
    input  tri   id_3,
    input  logic id_4,
    input  uwire id_5,
    output logic id_6
);
  wire id_8;
  module_0(
      id_2, id_5, id_5, id_4
  );
  always @(posedge 1 or posedge id_1 == 1) id_6 = #1 id_4;
  xnor (id_0, id_1, id_5, id_2, id_3, id_8, id_4);
endmodule
