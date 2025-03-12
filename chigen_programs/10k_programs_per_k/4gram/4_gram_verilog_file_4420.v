// Seed: 1457091992
module module_0 (
    input wor id_0,
    output tri1 id_1,
    output supply1 id_2,
    input tri id_3,
    input wand id_4,
    input wire id_5,
    input supply1 id_6,
    output tri1 id_7,
    input wire id_8,
    input wor id_9,
    input wire id_10,
    input supply0 id_11,
    input uwire id_12,
    input tri id_13,
    input tri1 id_14,
    input wor id_15,
    output uwire id_16
);
  integer id_18;
  ;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    input wor id_2,
    input wire id_3,
    input wand id_4
);
  always_ff @(posedge 1 or -1) begin : LABEL_0
    id_0 -= -1;
  end
  wire id_6;
  notif1 primCall (id_0, id_6, id_4);
  logic id_7;
  ;
  assign id_7 = -1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_2,
      id_3,
      id_3,
      id_1,
      id_0,
      id_2,
      id_4,
      id_3,
      id_2,
      id_4,
      id_2,
      id_1,
      id_1,
      id_0
  );
endmodule
