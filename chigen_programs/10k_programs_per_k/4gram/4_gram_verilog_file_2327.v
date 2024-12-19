// Seed: 1563582991
module module_0 (
    input supply1 id_0,
    output wor id_1,
    input tri id_2,
    output wand id_3,
    input wor id_4
    , id_13,
    output wor id_5,
    output uwire id_6,
    output supply1 id_7,
    output supply1 id_8,
    output tri id_9,
    input tri1 id_10,
    input tri0 id_11
);
  wire id_14;
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    output wire id_0,
    input uwire id_1,
    output logic id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    output wire id_6,
    inout logic id_7,
    input uwire id_8,
    output wand id_9,
    input logic id_10,
    output logic id_11
);
  always @(1 or posedge 1) begin : LABEL_0
    if (id_4) begin : LABEL_0
      id_11 <= 1;
    end else begin : LABEL_0
      #1;
      if (id_1) id_2 <= id_4 ? "" : 1;
      else id_7 <= id_10;
    end
  end
  module_0 modCall_1 (
      id_5,
      id_0,
      id_8,
      id_6,
      id_1,
      id_9,
      id_3,
      id_9,
      id_6,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.type_20 = 0;
  assign id_7 = 1 && ~id_4;
endmodule
