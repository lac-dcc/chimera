// Seed: 3142550023
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    input tri0 id_2,
    output wand id_3,
    input tri1 id_4,
    output tri1 id_5,
    input tri id_6,
    output wor id_7,
    output wire id_8,
    input supply0 id_9,
    input tri1 id_10,
    input wire id_11,
    output wire id_12,
    input wand id_13,
    output uwire id_14,
    input wor id_15,
    output supply0 id_16
);
  id_18 :
  assert property (@(id_4) 1'b0)
  else begin : LABEL_0
    #(1) begin : LABEL_1
      $clog2(32);
      ;
    end
  end
  assign module_1.id_16 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output supply0 id_1,
    input supply0 id_2,
    output supply1 id_3,
    output tri1 id_4,
    input tri id_5,
    output wor id_6,
    input uwire id_7,
    input wand id_8,
    input tri0 id_9,
    input wand id_10,
    output tri0 id_11,
    input wor id_12,
    output wire id_13,
    output supply0 id_14,
    input wand id_15,
    input uwire id_16
);
  module_0 modCall_1 (
      id_2,
      id_11,
      id_2,
      id_0,
      id_15,
      id_4,
      id_8,
      id_1,
      id_1,
      id_7,
      id_9,
      id_9,
      id_3,
      id_12,
      id_1,
      id_12,
      id_3
  );
endmodule
