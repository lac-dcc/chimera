// Seed: 2323280065
module module_0 (
    input tri0 id_0,
    input wire id_1,
    output tri id_2,
    input wor id_3,
    input wire id_4,
    input wand id_5,
    input tri1 id_6,
    output supply1 id_7,
    output supply0 id_8,
    input tri id_9,
    output tri0 id_10,
    input tri id_11,
    output tri0 id_12,
    input wire id_13,
    input tri id_14,
    output uwire id_15,
    input wor id_16,
    output tri0 id_17,
    input tri1 id_18,
    output tri0 id_19,
    output supply0 id_20,
    input supply1 id_21,
    output tri0 id_22,
    output wand id_23
);
  assign id_23 = id_3;
endmodule
module module_1 #(
    parameter id_7 = 32'd51
) (
    input tri id_0#(.id_23(1)),
    input wand id_1,
    output wand id_2,
    input supply0 id_3,
    output uwire id_4,
    output uwire id_5[(  1  ) : -1],
    input uwire id_6,
    output tri1 _id_7,
    output wire id_8,
    input uwire id_9,
    output supply0 id_10,
    output tri0 id_11,
    output supply0 id_12,
    input tri1 id_13,
    input wire void id_14,
    input tri1 id_15,
    output wire id_16,
    input wire id_17,
    input uwire id_18,
    input uwire id_19[1 : id_7  +  1 'b0],
    input tri id_20,
    input wire id_21
);
  always begin : LABEL_0
    @(posedge 1) $clog2(46);
    ;
  end
  wire id_24, id_25, id_26, id_27;
  xor primCall (
      id_10,
      id_3,
      id_14,
      id_21,
      id_20,
      id_24,
      id_15,
      id_9,
      id_26,
      id_27,
      id_25,
      id_13,
      id_17,
      id_0,
      id_19,
      id_6
  );
  module_0 modCall_1 (
      id_14,
      id_18,
      id_4,
      id_9,
      id_1,
      id_18,
      id_20,
      id_8,
      id_10,
      id_0,
      id_10,
      id_18,
      id_8,
      id_3,
      id_3,
      id_2,
      id_19,
      id_11,
      id_1,
      id_5,
      id_2,
      id_15,
      id_12,
      id_10
  );
  assign modCall_1.id_23 = 0;
endmodule
