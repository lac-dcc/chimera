// Seed: 282178824
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always_comb
    if (id_1) @(1'h0 or negedge 1 & id_2) id_3 = id_2 + 1;
    else id_5 = id_1 - id_2;
  wire id_6;
  tri  id_7 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = id_1;
  assign id_1 = 1;
  module_0(
      id_4, id_4, id_4, id_4, id_4
  );
  always begin
    @(id_1, posedge 1) id_1 <= #0 id_5;
  end
  tri0 id_6 = id_2;
  wire id_7;
  for (id_8 = 1; id_2; id_8 = id_2) begin
    assign id_4 = id_2;
  end
  wire id_9;
  tri id_10, id_11, id_12, id_13 = 1, id_14, id_15, id_16, id_17;
  wire id_18;
endmodule
