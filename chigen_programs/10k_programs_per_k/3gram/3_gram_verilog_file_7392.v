// Seed: 3659437213
module module_0 (
    output tri0  id_0,
    output uwire id_1,
    output wor   id_2,
    output tri   id_3,
    input  tri   id_4
);
  if (1) begin : LABEL_0
    logic id_6;
    ;
    assign id_2 = id_4;
  end
  assign id_0 = 1;
  wire id_7 = id_4;
  assign module_1.id_18 = 0;
endmodule
module module_1 (
    input uwire id_0
    , id_21,
    output tri id_1,
    output wand id_2,
    inout supply0 id_3,
    output supply0 id_4,
    output supply1 id_5,
    input wor id_6,
    output tri0 id_7,
    input wire id_8,
    input uwire id_9,
    input tri1 id_10,
    input tri id_11,
    input wand id_12,
    input tri0 id_13,
    output supply1 id_14,
    input supply0 id_15,
    input tri id_16,
    input uwire id_17,
    input wand id_18,
    input wire id_19
);
  wire id_22;
  wire id_23;
  and primCall (
      id_3,
      id_21,
      id_12,
      id_10,
      id_19,
      id_8,
      id_22,
      id_15,
      id_0,
      id_23,
      id_6,
      id_16,
      id_9,
      id_18,
      id_13,
      id_17
  );
  module_0 modCall_1 (
      id_5,
      id_3,
      id_3,
      id_3,
      id_11
  );
endmodule
