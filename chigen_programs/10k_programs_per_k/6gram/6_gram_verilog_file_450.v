// Seed: 1903694437
module module_0 (
    input wor id_0,
    input uwire id_1,
    input logic id_2,
    input uwire id_3,
    output uwire id_4,
    input supply0 id_5,
    input tri id_6,
    output tri id_7,
    input wor id_8,
    output uwire id_9,
    input uwire id_10,
    output tri id_11
    , id_15,
    output wand id_12,
    output wire id_13
);
  always @(posedge 1 === 1'b0 or 1) begin : LABEL_0
    if (id_3) id_15 <= id_2;
  end
endmodule
module module_1 (
    output logic id_0,
    output tri1 id_1,
    input logic id_2,
    input wor id_3,
    input tri id_4,
    output supply1 id_5,
    output supply0 id_6
);
  module_0 modCall_1 (
      id_3,
      id_4,
      id_2,
      id_3,
      id_5,
      id_3,
      id_4,
      id_1,
      id_3,
      id_5,
      id_3,
      id_1,
      id_6,
      id_6
  );
  assign modCall_1.type_6 = 0;
  reg id_8;
  always @(posedge "") begin : LABEL_0
    #1;
    id_0 <= -(id_2);
    id_8 <= id_2;
  end
  integer id_9;
endmodule
