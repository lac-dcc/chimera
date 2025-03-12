// Seed: 4147529347
module module_0 (
    output tri0 id_0,
    output tri1 id_1,
    input uwire id_2,
    input uwire id_3,
    output tri1 id_4,
    input tri id_5,
    input supply1 id_6,
    input supply1 id_7,
    output tri0 id_8,
    input tri0 id_9,
    input wire id_10,
    input wire id_11,
    output logic id_12,
    output tri0 id_13,
    output uwire id_14,
    input wand id_15,
    input wand id_16,
    output logic id_17,
    output wand id_18,
    output tri id_19,
    output tri1 id_20,
    input uwire id_21,
    input wire id_22,
    input wand id_23,
    output wor id_24
);
  initial begin : LABEL_0
    $signed(23);
    ;
    if ("") begin : LABEL_1
      id_17 <= 1;
    end else begin : LABEL_2
      id_12 <= -1;
    end
  end
  wire id_26;
  wire id_27;
  parameter id_28 = ~-1;
  logic id_29;
  ;
  wire id_30;
endmodule
module module_1 #(
    parameter id_8 = 32'd65,
    parameter id_9 = 32'd68
) (
    input  tri0  id_0,
    inout  wand  id_1,
    output uwire id_2,
    output logic id_3,
    input  tri   id_4,
    output wand  id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_0,
      id_5,
      id_0,
      id_1,
      id_1,
      id_2,
      id_4,
      id_0,
      id_4,
      id_3,
      id_2,
      id_1,
      id_1,
      id_1,
      id_3,
      id_2,
      id_5,
      id_1,
      id_0,
      id_4,
      id_4,
      id_2
  );
  assign modCall_1.id_16 = 0;
  always @(posedge 1 == 1 or posedge -1) begin : LABEL_0
    id_3 <= -1 ? 1 : 1;
  end
  wire _id_8;
  and primCall (id_2, id_1, id_4, id_7, id_0);
  wire _id_9;
  logic [id_8 : -1  +  -1] id_10;
  integer [1  /  1 : id_9] id_11;
  ;
endmodule
