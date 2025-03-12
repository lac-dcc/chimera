// Seed: 4021642591
module module_0 #(
    parameter id_16 = 32'd76
) (
    input tri0 id_0,
    input tri id_1,
    output tri id_2,
    input uwire id_3,
    input wor id_4,
    output tri id_5,
    input wire id_6,
    output wire id_7,
    input tri1 id_8,
    input tri1 id_9,
    input supply1 id_10,
    input wand id_11
    , id_15,
    output tri1 id_12,
    output logic id_13
);
  wire _id_16;
  logic [1 : 1] id_17;
  localparam id_18 = {1 & "", 1};
  wire id_19[-1 : -1  ==  id_16];
  ;
  always @(id_1 or -1) begin : LABEL_0
    id_13 <= 1;
  end
  logic id_20;
  ;
endmodule
module module_1 (
    output logic id_0,
    input  wire  id_1,
    input  uwire id_2,
    input  tri1  id_3,
    input  tri0  id_4,
    output tri0  id_5
);
  always
    repeat (id_1 & -1 & id_1 & id_3[1])
      @(posedge id_1) begin : LABEL_0
        id_0 <= 1 + 1;
        id_0 <= -1;
      end
  module_0 modCall_1 (
      id_2,
      id_4,
      id_5,
      id_1,
      id_2,
      id_5,
      id_4,
      id_5,
      id_2,
      id_1,
      id_4,
      id_1,
      id_5,
      id_0
  );
  assign modCall_1.id_10 = 0;
endmodule
