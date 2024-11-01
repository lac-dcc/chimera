// Seed: 1152553673
module module_0 ();
  always @(id_1 or negedge id_1) begin
    fork
      begin
        wait (id_1);
        $display;
        #1 begin
          if (id_1 == 1) id_1 <= 1;
        end
      end
    join
  end
endmodule
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
    module_1,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25
);
  output wire id_26;
  output wire id_25;
  input wire id_24;
  output wire id_23;
  inout wire id_22;
  inout wire id_21;
  inout wire id_20;
  input wire id_19;
  inout wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_27, id_28, id_29, id_30;
  tri0 id_31;
  id_32(
      .id_0(1),
      .id_1($display(1 == 1'b0, 1, 1'b0 == 1 > id_25)),
      .id_2(id_18),
      .id_3(1),
      .id_4(1),
      .id_5(),
      .id_6(id_14),
      .id_7(1),
      .id_8(1 != id_24),
      .id_9(1'b0),
      .id_10(id_9),
      .id_11(id_1),
      .product(id_13 == 1)
  );
  tri  id_33 = 1;
  wire id_34;
  module_0(); id_35(
      .id_0(1), .id_1("" & id_19), .id_2(id_26)
  );
  assign id_13 = id_31;
endmodule
