// Seed: 1449991874
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
    id_11
);
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  logic [1 'b0 : -1] id_12 = {id_11, id_12}, id_13;
endmodule
module module_1 #(
    parameter id_2 = 32'd96,
    parameter id_4 = 32'd24,
    parameter id_5 = 32'd82,
    parameter id_8 = 32'd65,
    parameter id_9 = 32'd51
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    _id_5,
    id_6,
    id_7,
    _id_8,
    _id_9
);
  output wire _id_9;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_1,
      id_6,
      id_6,
      id_7,
      id_6,
      id_3,
      id_6,
      id_1,
      id_1
  );
  inout wire _id_8;
  input wire id_7;
  inout tri1 id_6;
  input wire _id_5;
  input wire _id_4;
  output wire id_3;
  output wire _id_2;
  inout wire id_1;
  if (-1) begin : LABEL_0
    if (1) wire [-1 : {  !  id_5  {  -1  }  }] id_10;
    else begin : LABEL_1
      assign id_6 = 1;
    end
  end
  parameter id_11 = 1'b0;
  struct packed {
    struct packed {
      id_12 id_13;
      logic [-1 : -1] id_14;
    } [1 : -1  &  1] id_15;
    struct packed {
      struct {
        logic [id_2 : -1 'b0] id_16;
        logic [id_4 : -1 'd0] id_17;
      } [id_8 : -1 'd0] id_18;
      logic [id_4 : -1] id_19;
    } [-1 : id_9] id_20;
  } id_21;
  wire [-1 : id_4] id_22;
  assign id_9 = id_21.id_20;
endmodule
