// Seed: 1875192613
module module_0 (
    input wor id_0,
    output supply1 id_1,
    output uwire id_2,
    output wor id_3,
    input uwire id_4,
    input wire id_5,
    output tri id_6,
    input supply1 id_7,
    input tri0 id_8,
    input tri1 id_9,
    input wire id_10,
    input wor id_11,
    output supply0 id_12,
    output wand id_13,
    input uwire id_14,
    input uwire id_15,
    input supply1 id_16,
    input wire id_17,
    input supply0 id_18
    , id_37,
    output tri id_19,
    input tri0 id_20
    , id_38,
    input tri id_21,
    input tri id_22,
    output supply1 id_23,
    output wand id_24,
    output tri id_25,
    input supply0 id_26,
    input wire id_27,
    input tri1 id_28,
    output tri0 id_29,
    input wor id_30,
    input tri id_31,
    input wand id_32,
    input wor id_33,
    input supply0 id_34,
    input wand id_35
);
  logic id_39;
endmodule
module module_1 (
    input tri0 id_0,
    output wire id_1,
    input tri id_2,
    input uwire id_3,
    input wor id_4,
    input tri0 id_5,
    input tri id_6,
    input tri1 id_7,
    output logic id_8,
    input uwire id_9,
    input supply1 id_10,
    input supply0 id_11,
    output supply1 id_12
);
  always #1
    #id_14 begin : LABEL_0
      @(posedge 1 or 1) begin : LABEL_1
        if (-1'b0) begin : LABEL_2
          id_8 = id_7;
        end else @(posedge id_2 or posedge id_14);
      end
    end
  module_0 modCall_1 (
      id_3,
      id_12,
      id_12,
      id_12,
      id_5,
      id_9,
      id_1,
      id_5,
      id_4,
      id_2,
      id_10,
      id_3,
      id_1,
      id_1,
      id_11,
      id_4,
      id_6,
      id_3,
      id_4,
      id_1,
      id_0,
      id_6,
      id_10,
      id_1,
      id_12,
      id_12,
      id_11,
      id_9,
      id_4,
      id_1,
      id_4,
      id_9,
      id_5,
      id_11,
      id_10,
      id_2
  );
  assign modCall_1.id_34 = 0;
endmodule
