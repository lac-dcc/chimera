// Seed: 3857576988
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    input tri0 id_2,
    output uwire id_3
);
  assign id_1 = 1;
  logic [7:0] id_5;
  ;
  assign id_3 = id_2;
  logic id_6;
  ;
  wire id_7;
  ;
  wire id_8;
  assign id_7 = ~id_5[-1];
endmodule
module module_1 (
    input wand id_0,
    input wand id_1,
    output supply0 id_2,
    input wand id_3,
    output wire id_4,
    output wire id_5,
    input tri id_6
);
  wire id_8;
  and primCall (id_5, id_3, id_8, id_6);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_6,
      id_5
  );
  assign modCall_1.id_3 = 0;
endmodule
