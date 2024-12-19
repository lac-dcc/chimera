// Seed: 590532698
module module_0 (
    input  wor  id_0,
    input  tri  id_1,
    input  tri0 id_2,
    output tri0 id_3,
    input  tri0 id_4,
    output tri0 id_5,
    input  wand id_6,
    input  tri1 id_7
);
  wire id_9;
endmodule
module module_1 (
    output supply1 id_0,
    output wor id_1,
    input wire id_2,
    output wor id_3,
    input supply0 id_4,
    output supply0 id_5,
    output supply1 id_6,
    input tri0 id_7,
    output uwire id_8,
    input wand id_9,
    input tri1 id_10,
    input supply0 id_11,
    output tri0 id_12,
    output wire id_13,
    output wire id_14,
    output wire id_15,
    output logic id_16,
    output supply1 id_17,
    input wire id_18,
    input uwire id_19
);
  nor primCall (id_12, id_2, id_7, id_18, id_19, id_10, id_4);
  module_0 modCall_1 (
      id_2,
      id_11,
      id_2,
      id_13,
      id_4,
      id_6,
      id_18,
      id_9
  );
  id_21 :
  assert property (@(posedge 1'b0) 1'b0)
  else begin : LABEL_0
    id_16 <= (1);
  end
  assign id_21 = id_2;
endmodule
