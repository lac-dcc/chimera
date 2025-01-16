// Seed: 2711276718
module module_0 (
    output logic id_0,
    input tri1 id_1,
    output wire id_2,
    input supply0 id_3,
    output tri0 id_4,
    input logic id_5,
    input supply0 id_6,
    output uwire id_7
);
  always id_0 <= id_5;
  assign module_1.id_0 = 0;
  assign id_7 = id_6;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    input  wor   id_2,
    output tri1  id_3,
    input  wand  id_4,
    output tri   id_5
);
  wire id_7;
  assign id_5 = id_4;
  logic id_8, id_9, id_10;
  always_ff begin : LABEL_0
    id_0 = -1;
    $display(id_10, id_1, id_10);
    begin : LABEL_0
      if (-1'h0) id_0 <= -1'b0;
    end
  end
  assign id_0 = id_10;
  wire id_11, id_12;
  module_0 modCall_1 (
      id_10,
      id_2,
      id_3,
      id_4,
      id_5,
      id_9,
      id_4,
      id_3
  );
  assign id_10 = {id_1{-1}};
endmodule
