// Seed: 2052216209
macromodule module_0 (
    input tri1 id_0,
    input wand id_1
);
  always_ff id_3 = !1 == -1;
  assign id_4 = 1 < id_3;
  wire id_5;
  reg id_6, id_7, id_8;
  always begin : LABEL_0
    id_6 = id_7;
    begin : LABEL_0
      begin : LABEL_0
        id_7 <= id_3;
      end
    end
  end
  assign id_3 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input tri1 id_1,
    input wire id_2,
    output tri id_3,
    input tri0 id_4
);
  assign id_3 = id_2;
  initial id_3 = id_0;
  module_0 modCall_1 (
      id_0,
      id_2
  );
  assign modCall_1.type_9 = 0;
endmodule
