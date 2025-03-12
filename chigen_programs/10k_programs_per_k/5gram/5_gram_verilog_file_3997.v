// Seed: 3695287046
module module_0 (
    input wire id_0,
    input wor id_1,
    input wire id_2,
    input wire id_3,
    output tri0 id_4,
    output tri id_5,
    output wand id_6,
    input supply0 id_7,
    input wand id_8,
    input wand id_9,
    output wand id_10,
    output supply1 id_11,
    output supply0 id_12,
    output wand id_13,
    output wor id_14,
    input supply0 id_15,
    output tri0 id_16,
    input supply1 id_17,
    input supply1 id_18,
    output tri id_19,
    input wire id_20,
    output wor id_21,
    output wor id_22,
    output uwire id_23,
    output tri1 id_24,
    output supply0 module_0
);
  assign id_6 = -1;
  id_27 :
  assert property (@(posedge "") id_9)
  else $clog2(75);
  ;
endmodule
module module_1 (
    output tri0 id_0,
    input wand id_1,
    input supply0 id_2,
    output supply0 id_3,
    output logic id_4,
    output wand id_5,
    output wor id_6,
    output wire id_7,
    input uwire id_8,
    input supply1 id_9,
    output tri0 id_10
);
  initial begin : LABEL_0
    id_4 <= id_9;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_9,
      id_7,
      id_6,
      id_10,
      id_8,
      id_9,
      id_8,
      id_10,
      id_5,
      id_6,
      id_3,
      id_7,
      id_9,
      id_10,
      id_8,
      id_8,
      id_3,
      id_8,
      id_5,
      id_10,
      id_3,
      id_6,
      id_6
  );
  assign modCall_1.id_24 = 0;
endmodule
