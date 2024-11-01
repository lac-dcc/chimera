// Seed: 2384462794
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  output wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_20;
  id_21(
      .id_0(1'b0)
  );
endmodule
module module_1 (
    input logic id_0
);
  logic id_2;
  reg   id_3;
  id_4 :
  assert property (@(posedge 1) id_0)
    if (id_4) begin
      #1 id_2 <= id_3;
    end else id_4 <= id_0;
  id_5(
      id_2, id_0, 1, 1, 1 - 1'h0, 1, 1
  );
  assign id_3 = (1);
  wire id_6;
  wire id_7;
  module_0(
      id_7,
      id_6,
      id_7,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_6,
      id_6
  );
  wire id_8, id_9;
  assign id_4 = ~id_0;
  id_10(
      id_9
  );
endmodule
