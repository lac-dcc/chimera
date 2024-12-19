// Seed: 2648370055
module module_0;
  tri id_1, id_2;
  wire id_3;
  assign id_2 = id_1;
  wand id_4, id_5;
  id_6(
      id_4, 'b0, 1'b0
  );
  wire id_7;
  logic [7:0] id_8;
  wire id_9;
  wire id_10;
  id_11(
      .id_0(1),
      .id_1(),
      .id_2(""),
      .id_3(1),
      .id_4(id_3),
      .id_5(1),
      .id_6(id_10),
      .id_7(1),
      .id_8(),
      .id_9(1 > 1)
  );
endmodule
module module_1 (
    output supply0 id_0
    , id_21,
    output uwire id_1,
    output logic id_2,
    input tri id_3,
    input uwire id_4,
    input wor id_5,
    input logic id_6,
    input tri id_7,
    output tri1 id_8,
    input uwire id_9,
    output logic id_10,
    output supply1 id_11,
    input tri id_12,
    input supply1 id_13,
    input tri id_14,
    input logic id_15,
    output logic id_16,
    output tri0 id_17,
    output logic id_18,
    input wor id_19
);
  assign id_10 = id_9 !== 1;
  if (id_3 ^ 1) begin : LABEL_0
    wire id_22, id_23, id_24;
    assign id_22 = 1;
  end
  assign id_16 = id_9 - 1;
  module_0 modCall_1 ();
  initial begin : LABEL_0
    #1 begin : LABEL_0
      id_16 <= {1'h0, 1} & ~id_21 & 1;
    end
  end
  initial begin : LABEL_0
    id_0  = {1, id_12};
    id_21 = 1'b0;
    if (id_13) begin : LABEL_0
      id_18 <= 1;
    end else begin : LABEL_0
      #1 begin : LABEL_0
        id_2 <= id_6;
      end
    end
    id_10 <= 1;
  end
  assign id_10 = id_15;
  wire id_25;
  assign id_16 = 1'h0;
endmodule
