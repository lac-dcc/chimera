// Seed: 3562927994
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input wor id_2,
    input uwire id_3,
    input wor id_4,
    output tri id_5,
    input tri id_6,
    output supply0 id_7,
    input tri id_8,
    output supply1 id_9,
    input tri id_10
);
  tri1 id_12;
  wire id_13;
  assign module_1.type_7 = 0;
  initial begin : LABEL_0
    id_12 = 1;
  end
  id_14 :
  assert property (@(posedge 1) 1 / 1'b0 | 1)
  else $display;
endmodule
module module_1 (
    output uwire id_0,
    input tri1 id_1,
    output wor id_2,
    input tri id_3,
    output tri id_4,
    output tri0 id_5,
    input tri id_6,
    input tri1 id_7,
    input wor id_8,
    output tri id_9,
    input tri1 id_10,
    input uwire id_11,
    output wor id_12,
    input supply1 id_13,
    input tri1 id_14,
    input tri1 id_15,
    input uwire id_16,
    output tri1 id_17,
    input wire id_18,
    input wor id_19,
    input wor id_20
);
  supply0 id_22;
  assign id_22 = 1;
  assign id_2  = 1;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_1,
      id_19,
      id_14,
      id_0,
      id_10,
      id_12,
      id_18,
      id_9,
      id_16
  );
  assign id_9 = id_10 ? +id_10 : id_8;
  nor primCall (
      id_9,
      id_16,
      id_8,
      id_11,
      id_10,
      id_13,
      id_1,
      id_15,
      id_7,
      id_18,
      id_19,
      id_20,
      id_3,
      id_22,
      id_14,
      id_6
  );
endmodule
