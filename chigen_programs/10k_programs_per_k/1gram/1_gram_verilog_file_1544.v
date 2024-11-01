// Seed: 752895889
macromodule module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  always begin
    if (id_1 && id_2[1])
      `define pp_3 0
    else if (`pp_3) begin
      if (1'b0) `pp_3 = 1'b0;
    end
  end
  wire id_4;
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
    id_15
);
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  task id_16;
    id_6 = id_12;
  endtask
  module_0(
      id_9, id_10
  );
  supply0 id_17;
  assign id_14 = !1 && id_4#(
      .id_12(1 - 1),
      .id_9 (1'b0),
      .id_5 (id_16),
      .id_13(id_13),
      .id_10(id_5),
      .id_15(1),
      .id_12(id_17),
      .id_15(1),
      .id_13(id_1),
      .id_5 (id_10[1])
  );
  wire id_18;
endmodule
