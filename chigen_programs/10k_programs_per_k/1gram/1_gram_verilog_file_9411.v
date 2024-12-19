// Seed: 2626747325
module module_0 (
    output tri id_0,
    output supply1 id_1,
    output tri id_2,
    input uwire id_3,
    input uwire id_4
);
  wire id_6;
  reg  id_7;
  reg  id_8;
  id_9 :
  assert property (@(posedge id_8) 1) disable id_10;
  wire id_11;
  reg  id_12;
  assign id_10 = id_12;
  assign id_10 = 1;
  always
    if (id_4) $display;
    else begin : LABEL_0
      id_7 <= 1;
      begin : LABEL_0
        begin : LABEL_0
          if (1) id_7 <= id_10;
        end
      end
    end
  wire id_13;
  always id_8 = 1 + 1'b0;
  wire id_14;
  id_15(
      .id_0(1'h0),
      .id_1(1),
      .id_2(id_7),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(id_10),
      .id_7(1),
      .id_8(id_6),
      .id_9(1),
      .id_10(id_10)
  );
  wire id_16;
  tri1 id_17, id_18 = 1 - 1;
  tri id_19, id_20, id_21;
  assign id_20 = 1;
  reg id_22 = id_10, id_23;
  wire id_24, id_25;
endmodule
module module_1 (
    output logic id_0,
    input tri id_1,
    output tri0 id_2,
    input tri0 id_3,
    input tri1 id_4,
    input supply0 id_5,
    input wand id_6,
    input logic id_7,
    input wor id_8,
    input tri id_9,
    input wand id_10,
    output supply1 id_11,
    input uwire id_12,
    input tri1 id_13,
    input supply1 id_14,
    input wand id_15,
    input tri0 id_16,
    input tri1 id_17,
    output wire id_18,
    input tri1 id_19,
    input tri0 id_20
);
  assign id_0 = (1);
  wire id_22;
  module_0 modCall_1 (
      id_2,
      id_11,
      id_2,
      id_19,
      id_9
  );
  assign modCall_1.type_29 = 0;
  final id_0 <= id_7;
  logic [7:0][1] id_23;
endmodule
