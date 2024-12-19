// Seed: 2043117964
module module_0 (
    input  wand id_0,
    input  tri0 id_1,
    input  tri1 id_2,
    input  wand id_3,
    input  tri0 id_4,
    input  wire id_5,
    input  wand id_6,
    input  tri0 id_7,
    output tri  id_8
);
  always @(posedge 1 or posedge ~id_2) begin : LABEL_0
    id_8 = 1;
  end
  wire id_10;
  wire id_11;
  initial id_10 = 1;
  assign module_1.type_15 = 0;
endmodule
module module_1 (
    input  wand  id_0,
    output wand  id_1,
    input  tri0  id_2,
    input  wand  id_3,
    input  logic id_4,
    input  tri1  id_5,
    input  tri1  id_6,
    input  wire  id_7,
    output wor   id_8
);
  assign id_8 = 1;
  longint id_10 = id_6;
  module_0 modCall_1 (
      id_10,
      id_5,
      id_7,
      id_6,
      id_5,
      id_5,
      id_6,
      id_10,
      id_10
  );
  always @(posedge 1 + 1'b0, negedge 1)
    if (id_5) begin : LABEL_0
      fork
        id_11(id_2);
      join
    end else assign id_1 = id_4;
endmodule
