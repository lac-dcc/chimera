// Seed: 2955460582
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input tri id_2,
    input wor id_3,
    input tri1 id_4,
    input tri id_5,
    input uwire id_6,
    output supply0 id_7,
    output wand id_8
);
  always @(1 or posedge 1) begin : LABEL_0
    id_7 = ~id_0;
  end
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    output tri0 id_2,
    input wire id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.type_13 = 0;
endmodule
module module_2;
  reg id_1;
  assign id_1 = id_1;
  always @(posedge id_1) begin : LABEL_0
    if (id_1 - 1) begin : LABEL_0
      id_1 <= (id_1 - id_1);
      id_1 <= id_1;
    end
  end
endmodule
