// Seed: 23547623
module module_0 (
    input wor id_0,
    input tri id_1,
    input supply1 id_2,
    output uwire id_3,
    input tri1 id_4,
    input wire id_5,
    output supply1 id_6,
    input tri0 id_7,
    input uwire id_8,
    input wor id_9,
    input uwire id_10,
    input wire id_11,
    output tri id_12,
    output wand id_13,
    input tri0 id_14
);
  localparam id_16 = 1;
  reg id_17, id_18;
  logic id_19;
  initial begin : LABEL_0
    id_17 <= -1'b0;
  end
  assign module_1.id_8 = 0;
  logic id_20;
  ;
endmodule
module module_1 (
    output tri1 id_0,
    output supply0 id_1,
    input tri0 id_2,
    output wor id_3,
    input tri0 id_4,
    input supply1 id_5,
    input tri id_6,
    input tri0 id_7,
    output wand id_8,
    output wire id_9,
    output wire id_10
);
  assign id_8 = (id_7 == 1);
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_9,
      id_7,
      id_2,
      id_10,
      id_6,
      id_4,
      id_6,
      id_2,
      id_5,
      id_9,
      id_3,
      id_4
  );
endmodule
