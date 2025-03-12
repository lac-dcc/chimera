// Seed: 3068292537
module module_0 (
    input supply0 id_0,
    output logic id_1,
    input wor id_2,
    input wand id_3,
    input wor id_4,
    output uwire id_5
);
  assign id_5 = -1;
  assign id_1 = "" || id_2 | id_4;
  assign id_5 = id_0;
  wand id_7;
  assign id_7 = -1;
  parameter id_8 = 1 + 1;
  always_comb #1 @(id_3) id_1 <= 1;
  always begin : LABEL_0
    id_1 <= id_8;
  end
  assign id_7 = id_3;
  always begin : LABEL_1
    return id_7;
  end
endmodule
module module_1 (
    input tri0 id_0
    , id_26,
    input supply1 id_1,
    input uwire id_2,
    input wor id_3,
    output wor id_4,
    input wand id_5,
    output uwire id_6,
    input tri id_7,
    output wor id_8,
    input wor id_9,
    output tri1 id_10,
    output wor id_11,
    input uwire id_12,
    output wire id_13,
    output tri id_14,
    output logic id_15,
    output supply1 id_16,
    output wor id_17,
    input supply1 id_18,
    input tri0 id_19,
    input wor id_20,
    input tri0 id_21,
    input wire id_22,
    output wire id_23,
    output wire id_24
);
  wire id_27 = 1;
  parameter id_28#(
      .id_29(id_28),
      .id_30(-1'b0)
  ) = (id_28);
  module_0 modCall_1 (
      id_22,
      id_15,
      id_2,
      id_22,
      id_22,
      id_16
  );
  assign modCall_1.id_7 = 0;
  initial
    @(posedge -1) begin : LABEL_0
      id_15 <= id_21 - 1'b0;
    end
  assign id_17 = -1 ? id_27 : -1'd0 + -1'd0;
  assign id_10 = ~1 == id_5;
endmodule
