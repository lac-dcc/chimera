// Seed: 1994043677
module module_0 ();
  wire id_1;
  assign module_2.id_2 = 0;
  assign module_1.id_8 = 0;
  integer id_2 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input wand id_1,
    input wor id_2,
    output wand id_3,
    input supply1 id_4,
    input tri1 id_5,
    output uwire id_6,
    output wand id_7,
    input wor id_8,
    input tri id_9,
    output uwire id_10,
    input supply0 id_11,
    input supply0 id_12,
    input supply1 id_13
);
  wire id_15;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output tri id_0,
    input wor id_1,
    input tri0 id_2,
    output uwire id_3,
    input wor id_4,
    output logic id_5,
    input uwire id_6,
    input wire id_7,
    input supply1 id_8,
    input uwire id_9,
    input tri1 id_10,
    inout wire id_11,
    input supply1 id_12,
    output wor id_13
);
  always @* begin : LABEL_0
    if (id_2)
      #1 begin : LABEL_0
        if (id_9) disable id_15;
        id_5 <= 1;
      end
  end
  module_0 modCall_1 ();
endmodule
