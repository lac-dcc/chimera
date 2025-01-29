// Seed: 4290278598
module module_0 (
    output tri0 id_0,
    input uwire id_1,
    input supply1 id_2
);
  tri0 id_4 = 1;
  initial $display(1);
  assign id_0 = id_2 & (-1);
  assign module_1.id_9 = 0;
  assign id_0 = 1'b0;
  genvar id_5;
  wire id_7, id_8;
  always @(posedge "") begin : LABEL_0
    begin : LABEL_0
      id_0 = (1);
    end
  end
endmodule
module module_1 (
    input tri0 id_0,
    output tri0 id_1,
    input uwire id_2,
    output supply1 id_3,
    output tri1 id_4,
    output supply0 id_5,
    id_11,
    input supply0 id_6,
    input tri0 id_7,
    output supply1 id_8,
    output wor id_9
);
  always begin : LABEL_0
    id_1 = id_6;
    if (1)
      `define pp_12 0
    @(id_7) id_1 = 1;
  end
  module_0 modCall_1 (
      id_3,
      id_7,
      id_7
  );
endmodule
