// Seed: 1955849176
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
    id_19,
    id_20,
    id_21
);
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_22, id_23;
  logic [7:0] id_24, id_25;
  wire id_26;
  assign id_23 = id_25[1 : 1||1'b0];
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
    id_10
);
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always_ff begin
    if (id_8 && id_10 - (1'b0))
      @(posedge id_2[1'b0]) begin
        $display(id_9, 1);
        $display;
      end
  end
  module_0(
      id_7,
      id_10,
      id_10,
      id_10,
      id_5,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_3,
      id_10,
      id_9,
      id_4,
      id_6,
      id_3,
      id_10,
      id_10,
      id_10
  );
endmodule : id_11
