// Seed: 2338743475
module module_0 (
    input tri1 id_0,
    input tri id_1,
    input uwire id_2,
    input tri1 id_3,
    output tri0 id_4,
    input wire id_5,
    output wire id_6,
    input tri0 id_7,
    input supply1 id_8,
    output tri0 id_9
);
  assign id_4 = id_8;
  wire id_11, id_12;
  wire id_13;
  wire id_14 = ~id_1;
  tri0 id_15 = 1;
  assign module_1.type_0 = 0;
  always @(posedge 1) begin : LABEL_0$display
    ;
  end
endmodule
module module_1 (
    input  wand id_0,
    input  tri  id_1,
    output wand id_2
);
  assign id_2 = id_0;
  supply1 id_4;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2
  );
  or primCall (id_2, id_4, id_1);
  wire id_5;
  always @(id_4 or 1);
endmodule
