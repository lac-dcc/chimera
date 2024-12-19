// Seed: 3743960841
module module_0 (
    input uwire id_0,
    input wire id_1,
    output tri0 id_2,
    output tri0 id_3,
    output supply1 id_4,
    input wor id_5
);
  wire id_7;
  wand id_8;
  assign module_1.id_8 = 0;
  integer id_9 = id_9 == id_0;
  assign id_7 = 1 ? 1'd0 : id_8;
endmodule
module module_1 (
    output uwire id_0,
    output wire id_1,
    output tri1 id_2,
    input wand id_3
    , id_11,
    output supply1 id_4,
    input uwire id_5,
    output supply1 id_6,
    input uwire id_7,
    output wand id_8,
    output wor id_9
);
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_8,
      id_4,
      id_2,
      id_7
  );
  always @(negedge 1'h0) id_1 = 1;
  uwire id_14;
  wire  id_15;
  always @(id_14 == id_5) begin : LABEL_0
    if (id_11) id_14 = (1);
  end
endmodule
