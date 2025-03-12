// Seed: 443889613
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input uwire id_2,
    output wire id_3,
    output tri id_4,
    input supply1 id_5,
    output wor id_6
    , id_15,
    output tri0 id_7,
    input uwire id_8,
    input tri1 id_9,
    output tri1 id_10,
    input wand id_11,
    output tri id_12,
    output wor id_13
);
  specify
    $width(posedge id_16, id_0);
  endspecify
  assign module_1.id_11 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd54,
    parameter id_7  = 32'd86
) (
    output supply0 id_0,
    input uwire id_1,
    input tri1 id_2,
    output supply1 id_3,
    input supply1 id_4,
    output tri0 id_5,
    output wire id_6,
    input tri1 _id_7,
    output wand id_8,
    inout uwire id_9,
    output wor id_10,
    output tri0 id_11,
    output tri1 _id_12
);
  logic id_14 = id_7;
  assign id_14[1'h0] = -1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_9,
      id_8,
      id_5,
      id_4,
      id_3,
      id_6,
      id_1,
      id_1,
      id_0,
      id_1,
      id_11,
      id_6
  );
  struct packed {logic [1 : -1 'h0] id_15;} [1  ==?  id_12 : id_7] \id_16 ;
  ;
endmodule
