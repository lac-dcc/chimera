// Seed: 901374366
module module_0 (
    input tri1 id_0,
    output tri id_1
    , id_22,
    input supply1 id_2,
    input tri1 id_3,
    output wire id_4,
    output wire id_5,
    input supply1 id_6,
    output wand id_7,
    input supply0 id_8,
    output logic id_9,
    output wand id_10,
    input wor id_11,
    input wire id_12,
    output wire id_13,
    input tri0 id_14,
    input supply1 id_15,
    output supply0 id_16,
    input tri id_17,
    input tri id_18,
    output supply0 id_19,
    output uwire id_20
);
  always @* begin : LABEL_0
    if (1) id_9 <= -1;
  end
  assign module_1.id_17 = 0;
  assign id_5 = 1 == 1;
endmodule
module module_1 #(
    parameter id_11 = 32'd69,
    parameter id_12 = 32'd73
) (
    input tri id_0,
    output logic id_1,
    input wor id_2,
    output uwire id_3,
    input tri id_4
    , _id_11,
    output supply0 id_5,
    input uwire id_6,
    output wand id_7
    , _id_12,
    input supply0 id_8,
    output supply0 id_9
);
  bit  id_13;
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_3,
      id_8,
      id_8,
      id_9,
      id_5,
      id_4,
      id_7,
      id_6,
      id_1,
      id_9,
      id_6,
      id_2,
      id_7,
      id_0,
      id_0,
      id_5,
      id_8,
      id_8,
      id_3,
      id_9
  );
  logic [7:0][id_12  -  -1 : id_11] id_15;
  always @(posedge -1) begin : LABEL_0
    fork
      id_16(-1);
      id_17(!id_15[-1'd0 : 1==1], {id_12 !=? id_4, (({id_14, id_13}))}, -1, 1);
    join
    id_17 <= -1'b0;
    id_1  <= +id_15;
    id_13 <= id_8;
  end
  wire id_18;
  ;
  wire id_19;
endmodule
