// Seed: 4103438573
module module_0 (
    input uwire id_0,
    input wire id_1
    , id_18, id_19,
    output supply1 id_2,
    output supply1 id_3,
    input tri0 id_4,
    output wor id_5,
    output supply1 id_6,
    output supply1 id_7,
    input supply0 id_8,
    output wire id_9,
    input uwire id_10,
    output wand id_11,
    output wand id_12,
    input uwire id_13,
    output tri0 id_14,
    output wor id_15,
    input tri id_16
);
endmodule
module module_1 #(
    parameter id_12 = 32'd46,
    parameter id_22 = 32'd88,
    parameter id_6  = 32'd97
) (
    output logic id_0,
    output supply0 id_1,
    output uwire id_2,
    input wire id_3,
    output tri0 id_4,
    output wire id_5
    , id_24,
    input wor _id_6
    , id_25,
    output wire id_7,
    output logic id_8,
    input supply0 id_9,
    output tri1 id_10,
    input uwire id_11,
    input tri1 _id_12,
    input wand id_13,
    output wire id_14,
    output supply0 id_15,
    output supply1 id_16,
    input tri0 id_17,
    input wor id_18,
    input supply0 id_19,
    input tri id_20,
    input tri id_21,
    input tri0 _id_22
);
  if (1) begin : LABEL_0
    wire id_26;
    ;
    logic [id_12 : 1] id_27;
  end else logic id_28;
  ;
  module_0 modCall_1 (
      id_21,
      id_11,
      id_2,
      id_10,
      id_11,
      id_15,
      id_14,
      id_2,
      id_19,
      id_10,
      id_11,
      id_1,
      id_7,
      id_20,
      id_5,
      id_10,
      id_18
  );
  assign modCall_1.id_16 = 0;
  always begin : LABEL_1
    return id_11;
    fork
      id_25 <= id_17;
      id_8  <= ((id_28));
    join_none
    id_0 <= id_9;
    assign id_28[id_22 : id_6] = id_19;
  end
  wire id_29;
  parameter id_30 = -1;
endmodule
