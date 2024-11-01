// Seed: 1499587150
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
    id_15
);
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  tri0 id_16 = 1'b0, id_17;
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
    id_11
);
  input wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always_ff begin
    id_8 <= 1;
  end
  assign id_4[1] = id_5;
  module_0(
      id_9, id_7, id_10, id_9, id_6, id_6, id_6, id_6, id_9, id_6, id_6, id_9, id_6, id_3, id_6
  );
  reg id_12;
  always_comb
    if (1) begin
      id_12 <= id_2 ? id_5 == 1 : 1;
      `define pp_13 0
      if (id_5) id_12 = id_2;
    end else begin
      $display(1'b0);
    end
endmodule
