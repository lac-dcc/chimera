// Seed: 4020141301
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic id_9;
endmodule
module module_1 #(
    parameter id_10 = 32'd16,
    parameter id_11 = 32'd24,
    parameter id_3  = 32'd9
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    _id_11,
    id_12
);
  output wire id_12;
  output wire _id_11;
  input wire _id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  module_0 modCall_1 (
      id_6,
      id_9,
      id_12,
      id_9,
      id_6,
      id_6,
      id_7,
      id_7
  );
  output wire id_4;
  output wire _id_3;
  inout wire id_2;
  input wire id_1;
  wire [1 : id_10] id_13;
  wire id_14;
  struct packed {
    struct packed {
      struct packed {
        logic [id_11 : -1] id_15;
        id_16 id_17;
      } [id_11 : 1] id_18;
      logic id_19;
    } [id_3 : 1] id_20;
    logic [-1 : -1] id_21;
  } [1 'b0 : -1 'b0 /  !  id_3] id_22;
  ;
endmodule
