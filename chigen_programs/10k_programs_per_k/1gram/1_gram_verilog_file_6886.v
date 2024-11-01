// Seed: 4150850037
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
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always_comb #1 #1 $display("", 1);
  always
    if ((1))
      if (id_2)
        @(posedge id_7 & id_13 or id_8) begin
          id_4 <= id_12;
        end : id_14
      else @(posedge id_6) id_14 = id_6;
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
    id_16
);
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_17;
  wire id_18;
  initial #1 if (1'b0) id_1 <= id_3;
  module_0(
      id_4, id_17, id_18, id_3, id_2, id_14, id_4, id_11, id_12, id_18, id_5, id_3, id_17
  );
  always
  fork
    begin
      id_8[1'd0] -= 1;
      `define pp_19 0
    end
    return 1;
  join
  wire id_20, id_21;
endmodule
