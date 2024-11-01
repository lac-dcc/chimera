// Seed: 3932561579
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_8;
  wire id_9;
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
    id_13
);
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_14;
  wor  id_15 = id_11 == 1;
  module_0(
      id_8, id_12, id_4, id_4, id_9, id_4, id_15
  );
  reg  id_16;
  wire id_17;
  assign id_7[1] = ~id_9;
  wire id_18;
  wire id_19;
  always_comb @(posedge 1)
    if (id_9) id_1 <= 1;
    else begin
      {id_6 ==? 1 && 1} <= id_16;
    end
  always @(posedge id_15) begin
    wait (id_8);
  end
  wire id_20;
  assign id_2[1'h0] = {id_16, id_11 - 1};
endmodule
