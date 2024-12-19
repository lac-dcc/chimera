// Seed: 4025117185
module module_0 (
    input uwire id_0,
    input wor id_1,
    input tri1 id_2,
    output supply1 id_3,
    output wor id_4,
    input wor id_5,
    output supply0 id_6,
    input wor id_7,
    input tri1 id_8
    , id_13,
    output tri1 id_9,
    input supply1 id_10,
    output wire id_11
);
  assign id_13 = 1;
  reg id_14;
  assign module_1.id_3 = 0;
  always @(posedge 1 or id_0) begin : LABEL_0
    id_9 = id_8;
  end
  always @(id_5 or id_0 or posedge 1)
    if (1) id_14 = id_14;
    else begin : LABEL_0
      id_13 <= id_14;
    end
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    output tri1 id_2,
    output uwire id_3,
    input supply1 id_4,
    output tri id_5,
    input supply1 id_6,
    output wand id_7
);
  wire id_9;
  wor  id_10 = id_4;
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_7,
      id_7,
      id_1,
      id_10,
      id_0,
      id_0,
      id_10,
      id_10,
      id_7
  );
  wire id_12;
  wire id_13, id_14;
  assign id_14 = id_1;
endmodule
