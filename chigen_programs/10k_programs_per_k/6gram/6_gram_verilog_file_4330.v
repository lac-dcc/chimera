// Seed: 3002938840
module module_0 (
    output tri id_0,
    input tri1 id_1,
    output supply1 id_2,
    input wor id_3,
    input wor id_4
    , id_7,
    output tri1 id_5
);
  wand id_8 = id_7 - 1;
  wire id_9;
  wire id_11;
  assign id_5 = 1'b0;
  assign id_2 = 1'b0;
  assign module_1.type_10 = 0;
endmodule
module module_1 (
    input  wor   id_0,
    input  wor   id_1,
    input  uwire id_2
    , id_6,
    output logic id_3,
    output uwire id_4
);
  always @(posedge id_1) begin : LABEL_0
    id_3 <= id_6;
  end
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_1,
      id_0,
      id_4
  );
  wire id_7;
endmodule
