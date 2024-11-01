// Seed: 2106232770
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
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_14;
  always_ff begin
    @(*)
    if (id_9)
      if (1'b0) begin
        id_6 <= 1;
      end else id_12 = 1;
    else begin
      id_12 <= (id_8);
    end
  end
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  input wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always id_14 <= id_19;
  assign id_10 = {1{id_12}};
  tri1 id_20 = 1;
  assign id_10 = 1'd0;
  assign id_13 = id_19;
  wire id_21;
  assign id_2 = id_5;
  assign id_2 = id_9, id_7 = 1;
  wire id_22;
  wire id_23;
  supply0 id_24 = 1;
  id_25(
      .id_0(id_1), .id_1(id_19), .id_2(id_12++), .id_3(1)
  );
  tri0 id_26 = id_10;
  module_0(
      id_20, id_11, id_5, id_9, id_8, id_14, id_21, id_19, id_26, id_1, id_10, id_14, id_26
  );
endmodule
