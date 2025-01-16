// Seed: 3685099248
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input wor id_2,
    input supply0 id_3,
    output uwire id_4
);
  tri1 id_6;
  id_7(
      .id_0(-1), .id_1(id_3), .id_2(-1), .id_3(-1'b0), .id_4(id_3)
  );
  supply0 id_8, id_9;
  assign id_6 = ~id_2 ? id_1 : -1;
  wire id_10;
endmodule
module module_1 (
    input logic id_0,
    input wor id_1,
    input uwire id_2,
    input logic id_3,
    input wand id_4,
    output wand id_5,
    input wand id_6,
    input logic id_7,
    input uwire id_8,
    output supply1 id_9,
    input logic id_10,
    output logic id_11,
    input uwire id_12,
    input tri1 id_13,
    input wire id_14,
    output tri id_15,
    output wand id_16,
    input wand id_17,
    input uwire id_18,
    output tri1 id_19,
    input supply0 id_20,
    output tri0 id_21,
    input tri0 id_22,
    output tri id_23,
    input wor id_24,
    input logic id_25,
    input wor id_26,
    input supply0 id_27,
    output tri1 id_28,
    input supply1 id_29,
    input tri1 id_30,
    id_43,
    input logic id_31,
    input wire id_32,
    output wor id_33,
    input logic id_34,
    output logic id_35,
    input uwire id_36,
    output tri0 id_37,
    output wand id_38,
    input wire id_39,
    inout tri id_40,
    input supply1 id_41
);
  logic id_44, id_45, id_46;
  assign id_45 = id_7;
  tri id_47, id_48;
  initial begin : LABEL_0
    begin : LABEL_0
      case (id_25)
        -1: id_46 = -1;
      endcase
      id_11 <= 1 | 1;
      $display(id_46, id_25, 1, 1'b0, id_44);
    end
    if (id_7) begin : LABEL_0
      @(id_0 or posedge id_31) id_40 = -1'b0;
    end else;
    id_35 <= id_10.id_3;
  end
  always id_46 = id_34;
  tri id_49, id_50;
  wire id_51;
  assign id_45 = id_3;
  assign id_50 = id_47;
  assign id_21 = id_27;
  wire id_52, id_53;
  id_54(
      id_37
  );
  int id_55;
  assign id_50 = -1;
  assign id_50 = id_1;
  module_0 modCall_1 (
      id_40,
      id_27,
      id_29,
      id_50,
      id_49
  );
  assign modCall_1.id_4 = 0;
  always $display(id_6);
endmodule
