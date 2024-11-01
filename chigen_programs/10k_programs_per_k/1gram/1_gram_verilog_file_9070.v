// Seed: 661585618
module module_0;
  wire id_1;
  wire id_3;
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
    id_13#(
        .id_14(1),
        .id_15(id_16 - id_17),
        .id_18(id_19),
        .id_20({1'h0, 1'h0 & 1})
    ),
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28
);
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  inout wire id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_18 = 1;
  initial
    wait (1 == -id_15)
      fork
        $display(1);
        id_25 <= 1;
        $display(1 - (id_13));
        begin
          $display;
        end
        begin
          id_7 = id_18;
          id_24 <= id_15;
        end
        $display(id_13, id_6, 1, ~id_14, id_21, 1);
      join
  module_0();
  assign #1 id_7 = 1;
  or (
      id_10,
      id_12,
      id_13,
      id_14,
      id_15,
      id_18,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25,
      id_26,
      id_27,
      id_28,
      id_3,
      id_4,
      id_6,
      id_7,
      id_9
  );
endmodule
