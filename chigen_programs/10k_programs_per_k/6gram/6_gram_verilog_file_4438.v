// Seed: 1530420259
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input wire id_2,
    input wand id_3,
    input uwire id_4,
    input uwire module_0,
    output supply1 id_6,
    input tri1 id_7,
    output uwire id_8
    , id_11,
    output supply1 id_9
);
  assign id_6 = id_7 ? id_5 : -1;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output logic id_0,
    input uwire id_1,
    input wor id_2,
    output supply0 id_3,
    input tri1 id_4,
    input tri id_5,
    output logic id_6
);
  always @(posedge 1 or posedge id_1 == -1) begin : LABEL_0
    id_0 <= id_5;
  end
  always @(posedge -1) id_6 = #1 id_4 == id_1;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_2,
      id_5,
      id_2,
      id_3,
      id_1,
      id_3,
      id_3
  );
endmodule
