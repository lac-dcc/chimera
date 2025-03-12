// Seed: 4028771640
module module_0 (
    output tri id_0,
    output wire void id_1,
    output wire id_2,
    input supply0 id_3,
    input wand id_4,
    input wire id_5,
    output wand id_6,
    output supply0 id_7
);
  logic id_9;
  ;
  assign id_1 = -1;
  localparam id_10 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd32
) (
    output supply0 id_0,
    output wor id_1,
    input supply0 id_2,
    input wor id_3,
    output supply0 id_4,
    input tri0 _id_5[id_5 : -1],
    output wire id_6,
    input supply0 id_7
);
  assign id_0 = id_3;
  assign id_6 = id_2;
  or primCall (id_1, id_3, id_2, id_7);
  module_0 modCall_1 (
      id_0,
      id_6,
      id_6,
      id_2,
      id_3,
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
  always $signed(4);
  ;
endmodule
