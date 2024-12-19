// Seed: 1437645151
module module_0 (
    output wand id_0,
    output tri id_1,
    input tri1 id_2,
    output supply1 id_3,
    input wand id_4,
    output wire id_5
);
  wand id_7 = id_2;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    input tri id_2,
    input tri1 id_3,
    input logic id_4,
    input supply0 id_5,
    output logic id_6,
    input supply1 id_7,
    input tri1 id_8,
    output uwire id_9
);
  logic id_11 = 1;
  wire id_12, id_13;
  id_14(
      .id_0(id_13), .id_1(id_3)
  );
  always @(posedge 1 ^ id_4 or posedge 1'd0)
    if (1) begin : LABEL_0
      id_6 <= 1 - 1;
    end else id_6 = id_11;
  always @(*) id_11 = #1 id_4;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_5,
      id_9,
      id_5,
      id_9
  );
endmodule
