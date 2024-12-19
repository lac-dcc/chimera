// Seed: 1334738730
module module_0 (
    output wire id_0,
    input tri0 id_1,
    output wor id_2,
    input supply0 id_3,
    output tri id_4,
    input tri1 id_5,
    output uwire id_6,
    output wire id_7
);
  wire id_9;
  wire id_10;
  assign module_2.id_2 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input tri0 id_1,
    output supply0 id_2,
    output uwire id_3
);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3,
      id_1,
      id_2,
      id_1,
      id_2,
      id_3
  );
  assign modCall_1.type_1 = 0;
endmodule
module module_2 (
    input supply0 id_0,
    input tri1 id_1,
    output wor id_2,
    input wand id_3,
    output uwire id_4,
    input tri0 id_5,
    input wor id_6,
    output wand id_7,
    input tri1 id_8
);
  wire id_10 = 1;
  initial begin : LABEL_0
    if (&id_10 && 1)
      if (1 == id_8) begin : LABEL_0
        disable id_11;
      end
  end
  module_0 modCall_1 (
      id_2,
      id_6,
      id_4,
      id_8,
      id_7,
      id_1,
      id_7,
      id_7
  );
endmodule
