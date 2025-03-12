// Seed: 2353121391
module module_0 (
    input wand id_0,
    output wand id_1,
    input wire id_2,
    input tri0 id_3,
    input supply1 id_4,
    output wand id_5,
    input wor id_6,
    input tri0 id_7,
    input tri id_8,
    input uwire id_9,
    input uwire id_10,
    input wire id_11,
    input uwire id_12,
    input uwire id_13,
    input uwire id_14,
    input uwire id_15,
    output supply0 id_16,
    input wand id_17,
    input wand id_18,
    output uwire id_19,
    input uwire id_20
    , id_23,
    input wor id_21
);
  wire id_24;
  parameter id_25 = -1'd0;
  assign module_1.id_11 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input wand id_1,
    input wor id_2,
    output tri1 id_3,
    output uwire id_4,
    output supply0 id_5,
    input wand id_6,
    output wand id_7,
    input tri id_8,
    input wand id_9,
    output tri1 id_10,
    input tri1 id_11,
    output wor id_12,
    input supply1 id_13
);
  localparam id_15 = -1;
  if (1'b0) assign id_10 = id_1;
  else begin : LABEL_0
    localparam id_16 = {(1) {id_15}} > id_15;
  end
  module_0 modCall_1 (
      id_8,
      id_3,
      id_11,
      id_13,
      id_9,
      id_4,
      id_2,
      id_8,
      id_1,
      id_9,
      id_9,
      id_2,
      id_8,
      id_8,
      id_8,
      id_1,
      id_4,
      id_1,
      id_9,
      id_7,
      id_9,
      id_2
  );
  assign id_7 = id_13;
endmodule
