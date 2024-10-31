// Seed: 297372588
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8#(
        .id_9 (1 ^ id_10),
        .id_11(1'b0)
    ),
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
    id_26
);
  inout wire id_23;
  output wire id_22;
  inout wire id_21;
  output wire id_20;
  input wire id_19;
  input wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_25 = id_18;
  assign id_7[""] = 1;
  assign id_17[1 : 1] = 1'b0;
endmodule
module module_1 (
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
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = id_12;
  generate
    tri id_16;
  endgenerate
  always_ff begin
    fork
      if (id_12[1 : 1'b0])
        @(posedge 1) begin
          id_3 <= #1 id_9 % id_6;
        end
    join
  end
  integer id_17 = 1, id_18 = id_15;
  assign id_11 = 1;
  assign id_2  = id_17;
  reg id_19, id_20 = id_11;
  module_0(
      id_16,
      id_10,
      id_6,
      id_4,
      id_6,
      id_6,
      id_1,
      id_9,
      id_16,
      id_9,
      id_6,
      id_5,
      id_4,
      id_6,
      id_6,
      id_8,
      id_1,
      id_6,
      id_5,
      id_7,
      id_6,
      id_5,
      id_6
  );
  assign id_7 = 1 - 1 - id_19;
  final
    if (id_16 ? id_15 : id_11) begin
      id_2 <= id_18;
    end else;
  wire id_21;
  assign id_17 = 1;
endmodule
