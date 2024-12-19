// Seed: 3665313016
module module_0 (
    output uwire id_0,
    output uwire id_1,
    output uwire id_2,
    output supply0 id_3,
    input tri id_4,
    input tri id_5,
    input supply1 id_6,
    output wire id_7,
    input wor id_8
);
  assign module_2.type_10 = 0;
endmodule
module module_1 (
    output wor   id_0,
    input  uwire id_1
);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1
  );
  wire id_3;
  initial begin : LABEL_0
    if (id_3) begin : LABEL_0
      if ({1{1}}) id_0 = id_3;
    end
  end
endmodule
module module_2 (
    input tri1 id_0,
    input wor id_1,
    input uwire id_2,
    output wand id_3,
    input uwire id_4,
    input tri1 id_5,
    input supply1 id_6,
    output wand id_7
);
  module_0 modCall_1 (
      id_7,
      id_7,
      id_3,
      id_3,
      id_6,
      id_4,
      id_5,
      id_3,
      id_6
  );
endmodule
