// Seed: 2767531628
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input tri1 id_4,
    input wor id_5,
    output wand id_6,
    input supply0 id_7
);
  assign id_0 = id_5 & -1;
  wire id_9;
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    input tri1 id_2,
    output tri1 id_3,
    input supply0 id_4,
    input tri id_5
);
  bit id_7, id_8;
  always id_7 <= -1;
  assign id_7 = id_7;
  always_comb begin : LABEL_0
    do begin : LABEL_0
      id_7 <= 1;
    end while (id_4);
  end
  assign id_7 = id_8;
  initial id_3 = -1 && id_4;
  always #1 begin : LABEL_0
    id_7 = 1;
  end
  always $display(id_5, 1, -1 | {id_4{1 + 1}}, id_1 & ~1'b0);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_0,
      id_0,
      id_4,
      id_3,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule
