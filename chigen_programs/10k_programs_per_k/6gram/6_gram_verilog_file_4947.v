// Seed: 4006542460
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    input tri id_2
    , id_14,
    output wand id_3,
    input uwire id_4
    , id_15,
    input supply1 id_5,
    input supply0 id_6,
    output logic id_7,
    input tri1 id_8,
    output wire id_9,
    input wire id_10,
    input tri0 id_11,
    inout wire id_12
);
  wire id_16;
  assign module_1.id_14 = 0;
  always @(posedge "") for (id_9 = 1; id_16; id_12 = 1) @(posedge 1'b0) id_7 = #1 id_8 + id_12;
  id_17(
      .id_0(id_12), .id_1(1'b0), .id_2(1), .id_3(id_14[1])
  );
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    output supply0 id_2,
    output uwire id_3,
    input supply0 id_4,
    input tri1 id_5,
    output logic id_6,
    input uwire id_7,
    output supply0 id_8,
    input supply0 id_9,
    input supply1 id_10,
    output supply1 id_11,
    input wor id_12,
    input tri0 id_13,
    output supply1 id_14,
    output supply0 id_15,
    inout tri id_16,
    input wor id_17,
    input uwire id_18,
    input tri0 id_19,
    input tri id_20,
    input tri id_21,
    input tri0 id_22,
    input uwire id_23,
    input wor id_24,
    input tri id_25,
    output wand id_26,
    input tri0 id_27,
    input tri id_28,
    output wor id_29,
    input supply1 id_30
    , id_53,
    input supply0 id_31,
    output wor id_32,
    input tri0 id_33,
    input wand id_34,
    input wire id_35,
    input supply0 id_36,
    input tri1 id_37,
    output logic id_38,
    input supply1 id_39,
    output uwire id_40,
    input wire id_41,
    output supply0 id_42,
    input wire id_43,
    input uwire id_44,
    input wand id_45,
    input wand id_46,
    input uwire id_47,
    input tri0 id_48,
    input wor id_49,
    input tri id_50,
    output logic id_51
);
  logic [7:0] id_54;
  module_0 modCall_1 (
      id_4,
      id_16,
      id_45,
      id_11,
      id_43,
      id_22,
      id_20,
      id_6,
      id_18,
      id_26,
      id_47,
      id_12,
      id_16
  );
  assign id_53 = 1;
  always begin : LABEL_0
    id_38 = 1;
    for (id_53 = 1; id_54[1] & id_16; id_6 = 1) begin : LABEL_0
      id_38 = #1{id_46, 1 + id_35, id_35} != 1;
      id_16 += 1;
      id_6  <= 1;
      id_38 <= 1'b0;
      id_51 <= id_41 - id_9;
    end
  end
endmodule
