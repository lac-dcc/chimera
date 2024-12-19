// Seed: 958086055
module module_0 (
    output wand id_0,
    output tri1 id_1,
    output wand id_2,
    output uwire id_3,
    input tri1 id_4,
    output wire id_5,
    output tri1 id_6,
    output wor id_7,
    output tri1 id_8,
    input supply1 id_9,
    output supply0 id_10,
    output tri0 id_11,
    output wand id_12,
    output wire id_13,
    input tri0 id_14,
    output wor id_15,
    input tri1 id_16,
    input supply1 id_17,
    output tri id_18
);
  wor id_20 = (1);
  assign module_1.id_2 = 0;
  tri1 id_21 = 1;
  wand id_22 = id_20;
  wire id_23;
  id_24 :
  assert property (@(posedge 1) 'b0)
  else begin : LABEL_0
    id_2 = 1 <= "";
  end
  wire id_25;
endmodule
program module_1 (
    output supply0 id_0,
    input wire id_1,
    input tri id_2,
    input tri1 id_3,
    input uwire id_4,
    input wire id_5
);
  wire id_7;
  wire id_8;
  tri0 id_9 = 1;
  final $display(1'b0, id_1);
  wire id_10;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_4,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_4,
      id_0,
      id_5,
      id_2,
      id_0
  );
endprogram
