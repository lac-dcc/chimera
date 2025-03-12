// Seed: 3660730939
module module_0 (
    id_1,
    id_2#(
        .id_3(1),
        .id_4(-1),
        .id_5(id_6)
    ),
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_12;
  parameter id_13 = "";
endmodule
module module_1 #(
    parameter id_11 = 32'd46,
    parameter id_9  = 32'd51
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    _id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  output wire id_19;
  input wire id_18;
  input wire id_17;
  input wire id_16;
  output wire id_15;
  module_0 modCall_1 (
      id_5,
      id_13,
      id_15,
      id_1,
      id_17,
      id_3,
      id_1
  );
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire _id_11;
  output wire id_10;
  input wire _id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_20, id_21, id_22;
  wire id_23;
  final begin : LABEL_0
    struct packed {
      logic [1 : -1] id_24;
      logic id_25;
      logic [id_11 : id_9] id_26;
    } id_27;
    if (1'b0) begin : LABEL_1
      disable id_28;
    end
  end
  wire id_29;
  parameter id_30 = 1;
endmodule
