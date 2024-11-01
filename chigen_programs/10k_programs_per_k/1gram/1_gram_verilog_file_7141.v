// Seed: 3533338185
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
    id_16
);
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
  generate
    reg id_17;
    always_ff
      if (id_15 | id_2) id_13 <= id_17;
      else id_13 = id_6;
    id_18(
        id_7
    );
    assign id_16 = 1'b0;
  endgenerate
  reg id_19, id_20;
  always begin
    begin
      id_17 <= "";
      id_16 = new[1] (1);
    end
    id_5 <= id_20;
  end
  integer id_21 (
      1'b0,
      - !1
  );
  wire id_22;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_5;
  assign id_5 = 1'b0;
  for (id_6 = id_1; 1'h0; id_6 = id_2) wire id_7;
  reg id_8 = 1;
  module_0(
      id_3, id_7, id_5, id_3, id_8, id_6, id_7, id_7, id_4, id_7, id_5, id_7, id_6, id_7, id_3, id_6
  );
  assign id_7 = 1;
  always
    if (id_8) $display(id_2);
    else id_6 <= id_8;
endmodule
