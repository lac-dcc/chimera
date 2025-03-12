// Seed: 3436941765
module module_0 #(
    parameter id_2 = 32'd86
) (
    id_1
);
  output wire id_1;
  logic [7:0] _id_2, id_3, id_4, id_5;
  assign id_4 = id_4[id_2];
  logic id_6;
  assign id_1 = id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  module_0 modCall_1 (id_4);
  inout wire id_1;
  logic id_6;
endmodule
module module_2 #(
    parameter id_19 = 32'd17,
    parameter id_24 = 32'd18,
    parameter id_5  = 32'd45
) (
    output logic id_0,
    output tri1 id_1,
    output supply0 id_2,
    input supply0 id_3,
    input wire id_4,
    output wor _id_5[id_5 : (  -1 'h0 )],
    output wire id_6,
    output logic id_7,
    output tri id_8,
    output supply1 id_9,
    input wire id_10,
    input wand id_11
    , id_21,
    input supply0 id_12#(
        .id_22 (-1),
        .id_23 (1),
        ._id_24(1),
        .id_25 (1),
        .id_26 (-1),
        .id_27 (1 && 1),
        .id_28 (1'b0),
        .id_29 (1),
        .id_30 (!'b0)
    ),
    output wire id_13,
    input supply1 id_14,
    input uwire id_15,
    output logic id_16,
    input supply1 id_17,
    output wand id_18,
    input tri1 _id_19
);
  assign id_21 = id_3;
  module_0 modCall_1 (id_23);
  parameter id_31 = 1;
  always begin : LABEL_0
    @(negedge 1'b0 or posedge 1'b0) @(posedge id_4 - id_30) id_28[id_19][id_24] = 1 ? id_23 : id_15;
    id_0 <= -1;
    begin : LABEL_1
      $signed(93);
      ;
      id_27 = id_31;
    end
    begin : LABEL_2
      id_7 <= -1'h0;
    end
    id_16 <= -1;
    if (1) SystemTFIdentifier(-1);
    begin : LABEL_3
      id_30 = id_17;
    end
  end
endmodule
