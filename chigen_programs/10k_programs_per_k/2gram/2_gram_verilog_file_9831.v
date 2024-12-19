// Seed: 3605494805
module module_0 (
    input uwire id_0,
    input wand  id_1
);
  always begin : LABEL_0
    @(negedge id_0 or posedge id_1) id_3 = 1;
  end
  wire id_4;
  wire id_5;
  wire id_6;
  wire id_7;
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    output wire id_0,
    output wire id_1,
    input wire id_2,
    input tri0 id_3,
    output wor id_4,
    output tri0 id_5,
    output supply1 id_6,
    input wor id_7,
    input wire id_8,
    output tri0 id_9,
    input supply0 id_10
    , id_15,
    output tri1 id_11,
    output wand id_12,
    input uwire id_13
);
  assign id_4  = 1'h0;
  assign id_15 = id_7;
  module_0 modCall_1 (
      id_8,
      id_2
  );
  assign id_4 = id_13;
  or primCall (id_11, id_2, id_15, id_3, id_8, id_10, id_7, id_13);
endmodule
