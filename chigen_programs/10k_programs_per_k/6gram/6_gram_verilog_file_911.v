// Seed: 2240056306
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input supply0 id_2,
    output tri id_3,
    input wire id_4,
    input tri id_5,
    input tri id_6,
    input wor id_7,
    input supply1 id_8,
    output uwire id_9
);
  integer id_11, id_12, id_13;
  wire id_14 = id_11;
  wire id_15;
  assign id_9 = id_8;
endmodule
module module_1 (
    input supply0 id_0,
    output wire id_1,
    input wire id_2,
    input uwire id_3,
    input supply1 id_4,
    input supply1 id_5,
    output tri0 id_6,
    output uwire id_7,
    input wand id_8,
    output wand id_9
);
  wire id_11;
  int  id_12;
  always @("" or negedge 1) begin : LABEL_0$display
    ;
  end
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_1,
      id_0,
      id_5,
      id_5,
      id_3,
      id_5,
      id_7
  );
  assign modCall_1.type_2 = 0;
endmodule
