// Seed: 1624087056
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
  output wire id_18;
  output wire id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_10 = 1;
  initial begin
    $display(1'h0, id_15, id_9);
  end
  wire id_20;
  always @(id_6 or negedge 1'b0);
endmodule
module module_1 (
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
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(1 or id_8)
    if (id_3[1]) begin
      #1 begin
        forever begin
          id_1 <= id_6;
          id_5 = (id_6) >> id_4;
        end
      end
    end else id_2 = 1;
  module_0(
      id_2,
      id_4,
      id_7,
      id_2,
      id_7,
      id_2,
      id_2,
      id_4,
      id_4,
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_8,
      id_4,
      id_4,
      id_4
  );
endmodule
