// Seed: 2096633638
module module_0 (
    input uwire id_0
);
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output logic id_1,
    input tri0 id_2,
    input supply0 id_3,
    input tri1 id_4,
    input supply0 id_5
);
  always begin : LABEL_0
    id_1 <= id_2#(
        .id_2({1{1}}),
        .id_3(1),
        .id_2(1),
        .id_5(1)
    );
  end
  module_0 modCall_1 (id_2);
endmodule
module module_2 (
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
    id_13#(
        .id_14(id_15),
        .id_16(id_17)
    ),
    id_18,
    id_19,
    id_20,
    id_21
);
  output wire id_17;
  input wire id_16;
  input wire id_15;
  inout tri0 id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  parameter id_22 = 1;
  wire id_23;
  assign id_14 = 1;
  assign id_18 = -1;
endmodule
module module_3 #(
    parameter id_5 = 32'd30
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout uwire id_2;
  output uwire id_1;
  module_2 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_3,
      id_1,
      id_2,
      id_2,
      id_3,
      id_1
  );
  assign id_2 = -1'b0;
  assign id_2#(
      .id_3(1),
      .id_2(id_1++),
      .id_2(1 == 1),
      .id_2(1),
      .id_3(1),
      .id_3(1),
      .id_3(1),
      .id_3((1'h0) == -1),
      .id_3(1 < 1),
      .id_2(-1)
  ) = id_3 * id_3;
  if (1) begin : LABEL_0
    logic [1 : -1 'h0] id_4;
  end else begin : LABEL_1
    assign id_2 = 1;
  end
  _id_5 :
  assert property (@(posedge id_5, posedge id_2) id_2++)
  else;
  assign id_2 = -1;
  wire [-1 : id_5] id_6;
  nor primCall (id_1, id_2, id_3);
endmodule
