// Seed: 4276031718
module module_0 (
    output supply1 id_0,
    output tri id_1,
    input supply0 id_2,
    input wor id_3,
    output wire id_4,
    input supply0 id_5,
    input wor id_6
    , id_11,
    output supply1 id_7,
    input wor id_8,
    output tri id_9
);
  wire id_12;
  always @(posedge id_2 or posedge 1) force id_9 = 1;
  wire id_13;
endmodule
module module_1 (
    input wand id_0,
    output tri1 id_1,
    input supply1 id_2,
    input tri1 id_3,
    inout wor id_4,
    output supply1 id_5
);
  xor primCall (id_5, id_4, id_2, id_3, id_0, id_7);
  wire id_7;
  always @(posedge 1) begin : LABEL_0
    id_5 = 1;
  end
  module_0 modCall_1 (
      id_4,
      id_5,
      id_4,
      id_2,
      id_5,
      id_0,
      id_4,
      id_1,
      id_2,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule
