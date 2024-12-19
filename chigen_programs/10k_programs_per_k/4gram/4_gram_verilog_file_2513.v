// Seed: 3639670647
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output supply1 id_2,
    input wand id_3,
    input supply0 id_4,
    input wor id_5,
    output wire id_6,
    output supply1 id_7
);
  assign id_6 = id_1;
  wire id_9;
  assign module_1.id_49 = 0;
  tri id_10;
  assign id_10 = 1'b0;
  always @(1 or negedge 1) deassign id_6[1&&1 : 1];
endmodule
module module_1 (
    input tri0 id_0,
    input tri0 id_1,
    input tri id_2,
    output supply1 id_3,
    input logic id_4,
    output tri1 id_5,
    input wor id_6,
    input supply1 id_7,
    output supply0 id_8,
    input wand id_9,
    input tri1 id_10,
    input supply0 id_11,
    output wire id_12,
    input tri0 id_13,
    input tri1 id_14,
    output tri0 id_15,
    output uwire id_16,
    input supply1 id_17,
    output tri1 id_18,
    input tri0 id_19,
    output logic id_20,
    input wire id_21,
    input wire id_22,
    output wand id_23,
    output tri0 id_24,
    input supply0 id_25,
    output tri1 id_26,
    output wor id_27,
    input tri0 id_28,
    input supply1 id_29,
    input tri id_30,
    input tri0 id_31,
    output wor id_32,
    input supply0 id_33,
    output tri0 id_34,
    input tri0 id_35,
    input wand id_36,
    input tri1 id_37,
    output tri0 id_38
    , id_43,
    input wor id_39,
    input supply0 id_40,
    input wire id_41
);
  wire id_44;
  id_45(
      .id_0(1), .id_1(1'd0), .id_2(1)
  );
  module_0 modCall_1 (
      id_40,
      id_9,
      id_27,
      id_35,
      id_17,
      id_33,
      id_3,
      id_8
  );
  wire id_46;
  wire id_47;
  wire id_48;
  wor  id_49 = 1'h0;
  always_ff id_20 = #id_50 1;
  generate
    if (id_2) begin : LABEL_0
      genvar id_51;
    end else begin : LABEL_0
      always @(id_13 or ~id_43) begin : LABEL_0
        while (1)
        #1 begin : LABEL_0
          id_43 <= 1;
        end
      end
    end
  endgenerate
  wire id_52;
  assign id_43 = id_4;
  wire id_53, id_54;
  supply0 id_55 = id_36 - 1;
endmodule
