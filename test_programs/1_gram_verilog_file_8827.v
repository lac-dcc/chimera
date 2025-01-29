// Seed: 399941700
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
  wire id_4;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [7:0] id_4, id_5;
  wire id_6 = id_4[1];
  wire id_7;
  and primCall (id_2, id_3, id_5, id_1, id_4, id_7);
  module_0 modCall_1 (
      id_1,
      id_6
  );
endmodule
module module_2 #(
    parameter id_16 = 32'd57
) (
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
    .id_19(id_13#(
        .id_14(id_15[_id_16]),
        .id_17(id_18),
        .id_9 (id_1)
    )),
    id_3,
    id_1,
    id_10,
    id_5,
    id_1
);
  input wire id_18;
  inout wire id_17;
  output wire _id_16;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_20, id_21, id_22;
  assign id_19 = id_4;
  bit id_23 = 1;
  module_0 modCall_1 (
      id_5,
      id_21
  );
  always @(posedge -1'b0) begin : LABEL_0
    begin : LABEL_0
      id_19 <= id_23;
    end
  end
endmodule
