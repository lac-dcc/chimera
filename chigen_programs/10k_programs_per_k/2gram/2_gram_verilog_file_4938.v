// Seed: 1474828097
module module_0 (
    output supply0 id_0
);
  wire id_2;
  module_2 modCall_1 ();
  assign modCall_1.id_5 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input tri1 id_1,
    input supply0 id_2,
    input tri1 id_3
);
  wire id_5;
  module_0 modCall_1 (id_0);
  assign modCall_1.type_0 = 0;
endmodule
module module_2 ();
  reg id_1 = 1;
  reg id_2;
  assign id_1 = 1;
  wire id_3;
  initial begin : LABEL_0
    #id_4;
    disable id_5;
    id_5 <= id_1;
  end
  uwire id_6;
  wire  id_7;
  always begin : LABEL_0
    id_2 <= #1  (1);
  end
  wire id_8;
  assign id_1 = 1'd0;
  uwire id_9;
  assign id_9 = 1;
  assign id_8 = !id_6;
  id_10(
      .id_0(1)
  );
endmodule
