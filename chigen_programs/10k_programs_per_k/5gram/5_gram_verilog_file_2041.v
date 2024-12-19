// Seed: 3782029979
module module_0 (
    output supply1 module_0,
    input uwire id_1,
    input wand id_2,
    output wire id_3,
    input supply0 id_4,
    input tri1 id_5,
    output uwire id_6,
    input tri0 id_7,
    input wand id_8,
    input wor id_9,
    input tri0 id_10,
    input wand id_11,
    input wire id_12,
    input uwire id_13,
    output uwire id_14,
    input supply0 id_15,
    output wire id_16,
    input tri0 id_17,
    input supply0 id_18,
    input wor id_19,
    output tri0 id_20
);
  logic [7:0] id_22, id_23, id_24, id_25;
  assign id_25[1>=1'd0 : 1] = id_18;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1
);
  wor id_3;
  supply1 id_4 = id_3 == 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_1,
      id_3,
      id_1,
      id_3,
      id_0,
      id_1,
      id_1,
      id_1,
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_0,
      id_3
  );
  assign modCall_1.id_14 = 0;
  assign id_3 = id_0;
  always @(1 or posedge id_0 == 1) $display(id_3);
  assign id_4 = {id_3++, 1 == id_1, id_0 < id_0 + id_0} ? id_4 : 1 != 0;
endmodule
