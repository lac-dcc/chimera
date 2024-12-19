// Seed: 3008279431
module module_0 (
    input wor   id_0,
    input tri1  id_1,
    input tri0  id_2,
    input uwire id_3
);
  assign id_5 = id_3;
  uwire id_6;
  wire id_7, id_8;
  supply0 id_9;
  wire id_10 = id_10;
  wire id_11;
  tri0 id_12;
  assign module_1.type_7 = 0;
  assign id_9 = 1;
  wand id_13;
  wire id_14;
  assign id_12 = 1;
  `define pp_15 0
  reg id_16;
  id_17(
      id_2 + id_10, id_13
  );
  assign id_13 = 1'd0;
  assign id_6  = 1;
  wire id_18;
  always @(*) begin : LABEL_0
    `pp_15 <= id_16;
  end
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    output wor id_2,
    input tri id_3,
    input tri0 id_4,
    input tri id_5,
    input wand id_6
    , id_20,
    output supply1 id_7,
    output wire id_8,
    input wor id_9,
    output logic id_10,
    output supply1 id_11,
    input wand id_12,
    input wire id_13,
    output uwire id_14,
    output tri0 id_15,
    input tri0 id_16,
    input tri id_17,
    input tri0 id_18
);
  always @(posedge id_5 || 1'h0 || id_16 || 1) id_10 <= 1'b0;
  module_0 modCall_1 (
      id_5,
      id_18,
      id_6,
      id_4
  );
  tri1 id_21;
  assign id_21 = id_4;
endmodule
