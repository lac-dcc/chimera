// Seed: 378790232
module module_0 (
    output tri0  id_0,
    output tri   id_1,
    output wor   id_2,
    output tri   id_3,
    output tri   id_4,
    input  uwire id_5,
    input  tri1  id_6
);
  always begin : LABEL_0
    if (1'b0)
      @(posedge 1) begin : LABEL_0
        if (id_5) id_3 = id_6;
      end
  end
  tri1 id_8;
  assign id_8 = 1'b0;
  wire id_9;
  wire id_10;
  wire id_11;
endmodule
module module_1 (
    output wand id_0,
    input uwire id_1,
    output tri1 id_2,
    output wor id_3,
    input uwire id_4,
    input supply1 id_5,
    input tri id_6
);
  assign id_2 = "" == id_4;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_0,
      id_2,
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.id_6 = 0;
  function id_8;
    input id_9;
    begin : LABEL_0
      id_8 <= #1  (1) && 1 && 1;
    end
  endfunction
  reg id_10 = id_8 ? 1 : id_10 ? (id_10) : id_9;
endmodule
