// Seed: 1445026749
module module_0;
  reg id_1;
  initial begin : LABEL_0
    assert (id_1 - 1);
    id_1 <= 1;
  end
  assign module_2.id_5 = 0;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  reg  id_5;
  wire id_6;
  wire id_7 = id_7;
  reg  id_8;
  initial begin : LABEL_0
    id_8 <= id_5;
    id_5 <= 1;
  end
  module_0 modCall_1 ();
endmodule
module module_2 (
    input supply0 id_0,
    output tri1 id_1,
    input wor id_2,
    output wor id_3,
    output tri0 id_4,
    input uwire id_5,
    output wor id_6,
    input wand id_7,
    input tri0 id_8,
    input wor id_9
);
  wire id_11;
  integer id_12 = id_7;
  generate
    if (1) begin : LABEL_0
      id_13(
          .id_0(id_9), .id_1(id_5), .id_2(1)
      );
    end
  endgenerate
  module_0 modCall_1 ();
endmodule
