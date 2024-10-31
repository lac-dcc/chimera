// Seed: 162833802
module module_0 (
    input  tri1 id_0,
    output tri0 id_1,
    input  tri  id_2,
    output tri0 id_3,
    input  wand id_4,
    output wor  id_5
);
  assign id_5 = 1 ? 1'b0 : id_2;
  tri id_7;
  id_8(
      1, 1 != id_5 - 1'h0, id_5, !id_3, id_7
  );
endmodule
module module_1 (
    input  tri1  id_0,
    input  wand  id_1,
    input  tri0  id_2,
    input  logic id_3,
    output logic id_4,
    input  tri0  id_5,
    output wor   id_6,
    output logic id_7,
    input  tri0  id_8,
    input  tri0  id_9,
    input  wor   id_10,
    output tri   id_11
);
  always @(posedge id_10) begin
    id_7 <= id_3;
    id_4 <= 1'b0;
  end
  wire id_13, id_14;
  xnor (id_11, id_2, id_0, id_14, id_10, id_5, id_13, id_3, id_1);
  module_0(
      id_8, id_6, id_5, id_11, id_5, id_11
  );
endmodule
