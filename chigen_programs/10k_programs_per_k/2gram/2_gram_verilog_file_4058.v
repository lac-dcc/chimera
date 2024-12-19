// Seed: 2488024836
module module_0 (
    input tri1 id_0
);
  wire id_2;
endmodule
module module_1 (
    input  wire  id_0,
    output logic id_1,
    input  tri1  id_2,
    input  tri0  id_3
    , id_10,
    input  logic id_4,
    input  wire  id_5,
    output tri   id_6,
    input  wand  id_7,
    input  tri   id_8
);
  always begin : LABEL_0
    id_10 <= (id_3 & 1);
    id_6 = id_7 !== 1;
    if (1) begin : LABEL_0
      if (1) begin : LABEL_0
        id_10 <= #1 id_4;
        $display(id_4, id_10);
      end
      id_1 <= 1;
    end
  end
  module_0 modCall_1 (id_5);
  assign modCall_1.type_0 = 0;
endmodule
