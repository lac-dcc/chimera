// Seed: 1824347503
module module_0 (
    output tri0 id_0,
    output wire id_1,
    input tri0 id_2,
    input tri id_3,
    input supply0 id_4,
    input wand id_5,
    input wire id_6,
    output wire id_7,
    input tri1 id_8,
    input supply0 id_9,
    input supply1 id_10,
    input supply0 id_11,
    input supply1 id_12,
    output tri id_13,
    input wand id_14,
    input wire id_15,
    input wire id_16,
    output tri1 id_17,
    input tri0 id_18,
    output wire id_19,
    input supply1 id_20,
    input uwire id_21,
    input wand id_22,
    input tri0 id_23,
    output supply1 id_24,
    output uwire id_25,
    input tri id_26,
    input wor id_27#(
        .id_33({-1 - 1, 1, 1}),
        .id_34(-1),
        .id_35(1),
        .id_36(-1 - 1),
        .id_37(1),
        .id_38(1),
        .id_39(-1),
        .id_40(1),
        .id_41(1),
        .id_42(1),
        .id_43(-1),
        .id_44(1)
    ),
    output tri id_28,
    input supply1 id_29,
    output supply1 id_30#(
        .id_45(1),
        .id_46(1),
        .id_47(1),
        .id_48(-1),
        .id_49(!1'h0),
        .id_50(1)
    ),
    output wor id_31
);
  assign id_19 = -1;
  assign {id_44 != -1 && id_5, id_42, -1} = -1;
  assign (highz1, strong0) id_30 = 1;
  assign id_46 = !-1;
endmodule
module module_1 #(
    parameter id_6 = 32'd18
) (
    output wire id_0,
    output logic id_1,
    input tri1 id_2,
    output logic id_3,
    output wire id_4,
    output tri id_5,
    input supply1 _id_6
);
  initial
    if (1) begin : LABEL_0
      id_1 <= id_6;
      @(1 or id_2 - "") @(posedge 1 + id_6 || id_2);
      assert (id_6);
      id_1 <= 1;
    end else @(negedge !{1{id_2}} or negedge id_2) id_3 <= -1;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_4,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_4,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_5,
      id_0,
      id_2,
      id_2,
      id_4,
      id_2,
      id_5,
      id_5
  );
  assign modCall_1.id_0 = 0;
  logic id_8;
  ;
  wire id_9;
  wire [id_6 : -1] id_10;
  genvar id_11;
  assign id_11[""] = id_6;
  wire id_12;
endmodule
