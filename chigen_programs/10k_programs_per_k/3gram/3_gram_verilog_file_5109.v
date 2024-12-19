// Seed: 2706500864
module module_0 (
    input tri0 id_0,
    output tri id_1,
    input supply0 id_2,
    output supply0 id_3,
    input supply1 id_4,
    output supply0 id_5,
    input supply0 id_6
);
  always @(id_2 or posedge $display(~id_0 !=? id_4,
      id_6,
      id_0,
      id_4 <-> id_6,
      1
  ))
  begin : LABEL_0
    id_3 = ~1;
  end
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    input uwire id_2,
    input supply0 id_3,
    output uwire id_4,
    input wire id_5,
    output wor id_6,
    input uwire id_7,
    input wire id_8,
    input tri id_9,
    input supply1 id_10,
    output tri0 id_11,
    output tri1 id_12,
    output wand id_13,
    input uwire id_14,
    output wand id_15,
    input uwire id_16,
    input tri id_17,
    output wand id_18,
    output supply1 id_19,
    output wand id_20,
    input wor id_21,
    input supply0 id_22,
    inout uwire id_23,
    output supply0 id_24
);
  integer id_26, id_27;
  xor primCall (
      id_11,
      id_8,
      id_3,
      id_14,
      id_17,
      id_0,
      id_1,
      id_26,
      id_23,
      id_2,
      id_21,
      id_22,
      id_10,
      id_7,
      id_5,
      id_9,
      id_27
  );
  module_0 modCall_1 (
      id_0,
      id_11,
      id_10,
      id_11,
      id_17,
      id_19,
      id_16
  );
endmodule
