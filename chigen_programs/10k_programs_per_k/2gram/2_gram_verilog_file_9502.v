// Seed: 4070517186
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_1  = 32'd31,
    parameter id_10 = 32'd28,
    parameter id_11 = 32'd57,
    parameter id_12 = 32'd4,
    parameter id_9  = 32'd71
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    _id_10,
    _id_11,
    _id_12,
    id_13
);
  output wire id_13;
  inout wire _id_12;
  input wire _id_11;
  input wire _id_10;
  output wire _id_9;
  output logic [7:0] id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire _id_1;
  struct packed {
    struct packed {
      logic id_14;
      logic ["" : 1] id_15;
    } [id_9 : -1] id_16;
    logic [id_10 : id_12] id_17;
  } [id_11 : 1] id_18 = id_1;
  module_0 modCall_1 (
      id_13,
      id_6,
      id_7,
      id_6,
      id_7
  );
  assign id_8 = -1;
  logic [1 : 1] id_19;
  wire id_20;
  assign id_9 = id_1;
  always
    if (1 > -1'b0) deassign id_13;
    else begin : LABEL_0
      `define pp_21 0
      id_18.id_18.id_14[1] = {1{id_10}};
      if (1) begin : LABEL_1
        @* @(1 or posedge 1) id_8[1] = -1;
      end
    end
  assign id_18.id_17[id_1] = id_3;
endmodule
