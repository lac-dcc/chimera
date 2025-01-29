// Seed: 443928254
module module_0 (
    input tri1 id_0,
    input wand id_1,
    input tri0 id_2,
    input wand id_3,
    input uwire id_4,
    input supply1 id_5,
    output wand id_6
);
  assign id_6 = -1;
  tri1 id_8, id_9;
  wire id_10 = id_10, id_11;
  always id_9 = id_1;
  wire id_12;
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1
);
  tri id_3;
  tri0 id_4, id_5;
  always begin : LABEL_0
    id_3 = 1'd0;
    begin : LABEL_0
      begin : LABEL_0$display
        ;
      end
      id_3 = id_1;
    end
    wait (id_3) id_4 = id_1 ^ -1;
  end
  module_0 modCall_1 (
      id_0,
      id_3,
      id_3,
      id_0,
      id_0,
      id_1,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
