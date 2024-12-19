// Seed: 4099667038
module module_0 (
    input supply1 id_0
    , id_12, id_13,
    output wire id_1,
    output tri id_2,
    output supply1 id_3,
    output tri1 id_4,
    input wor id_5,
    input wor id_6,
    output tri1 id_7,
    input uwire id_8,
    input wire id_9,
    input wire id_10
);
  wire id_14;
  assign id_4 = id_10 == id_9;
endmodule
module module_1 (
    output supply1 id_0,
    output logic id_1,
    input tri0 id_2,
    output supply0 id_3,
    output wire id_4,
    input wire id_5,
    output uwire id_6,
    output supply0 id_7
);
  always @(id_2 or posedge id_5) begin : LABEL_0
    id_1 <= id_5 && 1;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_6,
      id_5,
      id_5,
      id_6,
      id_2,
      id_5,
      id_2
  );
  assign modCall_1.type_3 = 0;
endmodule
