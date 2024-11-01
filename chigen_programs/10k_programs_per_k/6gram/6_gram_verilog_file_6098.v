// Seed: 1961277949
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
    id_13,
    id_14
);
  input wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_11 = 1 || (id_2 || id_14) || id_11 != 1 || id_4;
  tri id_15;
  assign id_4 = 1'b0;
  id_16(
      .id_0(~id_6)
  );
  assign id_15 = 1;
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
    id_19,
    id_20,
    id_21
);
  input wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_22;
  module_0(
      id_20, id_9, id_8, id_4, id_9, id_21, id_4, id_12, id_18, id_14, id_9, id_8, id_22, id_5
  );
  always @(posedge id_13)
    #1 begin
      id_13 <= 1;
      if (id_17[1'd0+:1])
        if (1) begin
          id_15 <= id_17[1];
        end else id_1 <= 1;
      else id_1 <= id_13;
    end
  wire id_23;
  wire id_24;
  always @(posedge 1 + 0) begin
    id_11 <= 1;
  end
endmodule
