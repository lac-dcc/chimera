// Seed: 1201501120
module module_0 (
    input wand id_0,
    input supply0 id_1,
    input wire id_2,
    output supply0 id_3,
    output uwire id_4,
    output wire id_5,
    output wor id_6,
    input uwire id_7,
    input tri0 id_8,
    input uwire id_9,
    output tri id_10,
    output supply1 id_11
    , id_18,
    input tri0 id_12,
    input tri1 id_13,
    output wand id_14,
    input uwire id_15,
    output logic id_16
);
  always @(!id_18 or posedge 1) begin : LABEL_0
    fork
      id_16 <= id_9;
      id_19(~id_9);
    join
  end
endmodule
module module_0 #(
    parameter id_2 = 32'd68
) (
    output uwire id_0,
    input supply0 module_1
    , id_9,
    input tri _id_2,
    input tri id_3,
    output uwire id_4,
    output logic id_5,
    input uwire id_6,
    input wor id_7
);
  wor [1 : !  id_2] id_10 = 1'b0;
  assign id_0 = id_7;
  logic [7:0] id_11 = id_1;
  final begin : LABEL_0
    id_5 = #1 "";
  end
  assign id_4 = id_2;
  assign id_11[id_2] = -1 ? -1'b0 : 1 + 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_7,
      id_0,
      id_4,
      id_4,
      id_0,
      id_6,
      id_3,
      id_6,
      id_4,
      id_0,
      id_7,
      id_6,
      id_0,
      id_6,
      id_5
  );
  assign modCall_1.id_11 = 0;
  assign id_4 = id_1;
endmodule
