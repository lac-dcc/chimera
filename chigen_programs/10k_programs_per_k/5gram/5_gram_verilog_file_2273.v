// Seed: 1439858891
module module_0 (
    input tri1 id_0,
    output supply0 id_1,
    input tri0 id_2,
    input wire id_3,
    output wor id_4,
    output tri0 id_5,
    output wire id_6,
    input wire id_7,
    input wand id_8,
    output wand id_9,
    input supply1 id_10
    , id_42,
    output tri0 id_11,
    input uwire id_12,
    output wand id_13,
    input wand id_14,
    input tri id_15,
    input tri1 id_16,
    input wor id_17,
    input tri0 id_18,
    input uwire id_19,
    input supply1 id_20,
    output tri id_21,
    input tri0 id_22,
    input tri id_23,
    output wor id_24,
    input tri0 id_25,
    input tri0 id_26,
    output tri0 id_27,
    output wand id_28,
    input tri1 id_29,
    input tri0 id_30,
    output wor id_31
    , id_43,
    input uwire id_32,
    input wand id_33,
    input tri1 id_34,
    input wire id_35,
    input supply0 id_36,
    input tri0 id_37,
    input wire id_38,
    output wor id_39,
    input wor id_40
);
  assign id_28 = id_22;
  wire id_44;
  logic [7:0] id_45 = id_43;
  generate
    for (id_46 = 1'b0; 1; id_27 = id_22) begin : LABEL_0
      for (genvar id_47 = id_23; 1; id_13 = 1) begin : LABEL_0
        assign id_5 = id_42[1];
        for (id_48 = 1; 1; id_4++) begin : LABEL_0
          assign id_31 = id_38 ? id_38 : 1;
        end
      end
    end
  endgenerate
endmodule
module module_1 (
    input wire id_0,
    output wor id_1,
    input uwire id_2,
    output supply0 id_3,
    output wire id_4,
    input wand id_5,
    input supply0 id_6,
    input tri0 id_7,
    input uwire id_8,
    output supply1 id_9,
    output wand id_10
);
  assign id_10 = id_10++;
  wire id_12;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_5,
      id_1,
      id_4,
      id_4,
      id_7,
      id_6,
      id_1,
      id_0,
      id_1,
      id_5,
      id_3,
      id_0,
      id_0,
      id_5,
      id_8,
      id_8,
      id_0,
      id_2,
      id_1,
      id_2,
      id_8,
      id_4,
      id_5,
      id_0,
      id_9,
      id_3,
      id_0,
      id_8,
      id_9,
      id_6,
      id_8,
      id_6,
      id_8,
      id_5,
      id_5,
      id_5,
      id_1,
      id_7
  );
endmodule
