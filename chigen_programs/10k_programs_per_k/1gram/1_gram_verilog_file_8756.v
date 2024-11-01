// Seed: 745545846
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always id_2 <= id_2;
endmodule
macromodule module_1 (
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
    id_21,
    id_22
);
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  input wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  tri0 id_23;
  module_0(
      id_21, id_12, id_2, id_11, id_3
  );
  reg id_24;
  always_latch
    if (1) begin
      begin
        begin
          id_9 <= id_1(id_19, 1'b0 ^ id_6, id_23, id_16 < 1);
        end
        id_10 <= "";
        @(*) begin
          if (1) $display(1, id_9, 1'h0);
          id_12 <= id_17;
        end
      end
      @(negedge id_13) begin
        id_23 = 1;
        id_24 <= id_23 & "";
      end
    end
  or (
      id_12,
      id_3,
      id_4,
      id_20,
      id_10,
      id_5,
      id_21,
      id_7,
      id_13,
      id_2,
      id_8,
      id_22,
      id_16,
      id_1,
      id_23,
      id_6,
      id_17,
      id_9,
      id_19,
      id_18
  );
endmodule
