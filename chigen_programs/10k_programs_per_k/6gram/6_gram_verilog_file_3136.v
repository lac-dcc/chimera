// Seed: 3892543075
module module_0 (
    output wand id_0,
    output supply0 id_1,
    input tri id_2,
    input tri1 id_3,
    output supply1 id_4
);
  tri1 id_6;
  generate
    if (1 | 1'd0) begin : LABEL_0
      wire id_7;
    end else begin : LABEL_0
      assign id_1 = id_6;
    end
  endgenerate
endmodule
module module_1 (
    input wand id_0,
    output logic id_1,
    input wand id_2,
    output uwire id_3,
    input wand id_4,
    input logic id_5
    , id_11,
    input supply0 id_6,
    input tri id_7,
    input wand id_8,
    output tri1 id_9
    , id_12, id_13
);
  assign id_11 = id_0 !=? 1;
  module_0 modCall_1 (
      id_3,
      id_9,
      id_8,
      id_7,
      id_9
  );
  assign id_9 = 1;
  always id_1 <= #1 id_5;
endmodule
