// Seed: 22335035
program module_0 (
    output tri0 id_0,
    output wor id_1,
    output tri id_2,
    input wire id_3,
    input supply0 id_4,
    output supply0 id_5,
    output uwire id_6,
    input wire id_7,
    input wand id_8,
    input tri1 id_9,
    input supply1 id_10,
    input wire id_11,
    input wire id_12,
    output wire id_13,
    input uwire id_14,
    input wor id_15,
    input uwire id_16,
    output supply0 id_17#(
        .id_28(1),
        .id_29(-1),
        .id_30(-1),
        .id_31(1),
        .id_32(1),
        .id_33(-1),
        .id_34(1),
        .id_35(-1),
        .id_36(-1'b0),
        .id_37(-1),
        .id_38(1),
        .id_39(-1 ? 1 : 1),
        .id_40(1 & ""),
        .id_41(1)
    ),
    input wor id_18,
    input tri id_19,
    input tri id_20,
    output wor id_21,
    input supply0 id_22,
    input supply0 id_23
    , id_42,
    output wand id_24,
    input tri1 id_25,
    output wire id_26
);
  parameter id_43 = 1;
  assign id_35 = id_9;
  assign id_41 = (1'b0) - id_16;
  if (1) begin : LABEL_0
    assign id_17 = id_23;
  end else if (1)
    always_ff begin : LABEL_1
      @(posedge id_16 - 1, posedge -1 or posedge -1) begin : LABEL_2
        $clog2(65);
        ;
      end
    end
  assign id_28 = -1;
  wire id_44;
  parameter id_45 = {id_43{1}};
endprogram
module module_1 #(
    parameter id_4 = 32'd29,
    parameter id_5 = 32'd64,
    parameter id_8 = 32'd28,
    parameter id_9 = 32'd24
) (
    output wand id_0,
    output supply0 id_1,
    output wor id_2,
    input tri id_3,
    input tri _id_4,
    output wor _id_5
);
  integer id_7;
  ;
  logic [id_5 : id_4] _id_8;
  ;
  logic _id_9 = id_9;
  wire [!  id_8 : 1 'd0] id_10;
  wire [1 : id_9] id_11;
  pullup id_12 (1);
  wire id_13;
  ;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_3,
      id_3,
      id_1,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_2,
      id_3,
      id_1
  );
  logic id_14;
endmodule
