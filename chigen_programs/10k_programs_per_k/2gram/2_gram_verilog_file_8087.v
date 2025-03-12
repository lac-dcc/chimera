// Seed: 1301691722
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  input wire id_12;
  output wire id_11;
  output wand id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_10 = -1 !=? -1;
endmodule
module module_1 #(
    parameter id_3 = 32'd24
) (
    input supply1 id_0,
    output wire id_1,
    input wire id_2,
    input wor _id_3,
    output logic id_4,
    input uwire id_5,
    output logic id_6,
    input wire id_7,
    input supply0 id_8,
    input tri1 id_9,
    output logic id_10,
    output uwire id_11,
    input wand id_12,
    output logic id_13,
    input tri0 id_14,
    output tri1 id_15,
    inout tri1 id_16,
    output wor id_17,
    input tri id_18,
    output logic id_19,
    input wand id_20,
    input supply0 id_21,
    input wor id_22,
    input tri id_23
);
  assign id_17 = -1;
  struct packed {
    logic id_25;
    logic id_26;
    struct packed {
      logic id_27;
      logic [1 : id_3] id_28;
    } id_29;
    logic id_30;
  } id_31;
  ;
  module_0 modCall_1 (
      id_28,
      id_28,
      id_30,
      id_26,
      id_28,
      id_26,
      id_26,
      id_27,
      id_25,
      id_25,
      id_30,
      id_25,
      id_29
  );
  initial begin : LABEL_0
    id_13 <= 1 / 1;
  end
  final begin : LABEL_1
    if (1) id_10 = id_2;
    else begin : LABEL_2
      id_4  <= id_31.id_27;
      id_19 <= id_31.id_27;
      #1
      #1
      @(posedge 1) begin : LABEL_3
        $clog2(28);
        ;
        id_6 <= id_0;
      end
    end
  end
  assign id_15 = id_3;
endmodule
