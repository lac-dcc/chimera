// Seed: 1704848223
module module_0 (
    output wand id_0,
    input  tri0 id_1,
    output tri0 id_2,
    input  wand id_3,
    output tri1 id_4
    , id_6
);
  logic [7:0][1] id_7 (
      "" - id_4,
      ""
  );
  assign module_1.type_9 = 0;
  wire id_8;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    input logic id_2,
    input uwire id_3,
    input uwire id_4,
    inout logic id_5
);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_3,
      id_1
  );
  reg id_7;
  always begin : LABEL_0
    id_5 = {1, 1};
    id_5 <= id_2;
    @(1 or posedge id_7) $display(1'b0);
    id_5 <= !id_5;
    if (1'b0) id_7 = 1;
    else id_7 <= 1 + 1'b0;
  end
  id_8(
      1'b0, 1, id_2
  );
  assign id_5 = 1;
endmodule
