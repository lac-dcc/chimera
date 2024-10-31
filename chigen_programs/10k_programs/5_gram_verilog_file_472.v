// Seed: 1601384995
module module_0 #(
    parameter id_7 = 32'd26,
    parameter id_8 = 32'd69
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  defparam id_7.id_8 = id_3 == 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    .id_31(id_7),
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30
);
  input wire id_30;
  output wire id_29;
  inout wire id_28;
  input wire id_27;
  inout wire id_26;
  output wire id_25;
  inout wire id_24;
  input wire id_23;
  input wire id_22;
  inout wire id_21;
  input wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_32;
  module_0(
      id_6, id_24, id_28, id_6, id_32, id_9
  );
  wire id_33;
  assign id_3 = 1'd0 == 1 ? 1 : id_28;
  wire id_34;
  xnor (
      id_5,
      id_30,
      id_18,
      id_7,
      id_1,
      id_23,
      id_19,
      id_24,
      id_15,
      id_32,
      id_6,
      id_26,
      id_28,
      id_31,
      id_16,
      id_17,
      id_27,
      id_10,
      id_21,
      id_3,
      id_8,
      id_22,
      id_20,
      id_14,
      id_13
  );
  always @(posedge 1 or posedge id_19 - 1)
    if (1'b0) begin
      id_9 = 1;
      #1;
      module_1 <= id_5;
    end else begin
      id_3 = 1 == (id_6 == id_13 * 1'b0);
    end
endmodule
