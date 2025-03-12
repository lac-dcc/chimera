// Seed: 652590275
module module_0 (
    output tri id_0,
    input wand id_1,
    input wire id_2,
    input tri0 id_3,
    input supply0 id_4
);
  assign module_1.id_15 = 0;
  logic id_6;
endmodule
module module_1 #(
    parameter id_12 = 32'd20
) (
    output wand id_0,
    input uwire id_1,
    output logic id_2,
    input supply1 id_3,
    output supply0 id_4,
    output wand id_5,
    input tri0 id_6,
    output wand id_7,
    input wire id_8,
    input uwire id_9,
    output uwire id_10,
    input supply0 id_11,
    input wire _id_12,
    output tri0 id_13
);
  reg [id_12 : 1] id_15;
  module_0 modCall_1 (
      id_7,
      id_8,
      id_6,
      id_9,
      id_9
  );
  always_ff
  fork
    id_2 <= -1;
    #1
    if (1)
      if (1) id_15 <= !id_12;
      else begin : LABEL_0
        disable id_16;
      end
    else assume (-1);
  join
endmodule
