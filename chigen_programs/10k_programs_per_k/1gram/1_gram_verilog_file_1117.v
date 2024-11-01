// Seed: 2797977179
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  wire id_3;
  logic [7:0][1] id_4;
  wire id_5, id_6 = id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4 = id_1;
  module_0(
      id_4, id_3
  );
  assign id_3 = 1;
  for (id_5 = id_1; 1; id_2 = id_2) wire id_6;
endmodule
module module_2 (
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
    id_18
);
  output wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  id_19 :
  assert property (@(*) 1) begin
    id_11 <= id_15;
    assume ((1) == id_8)
    else;
    begin
      if (1) @(negedge id_17 & id_13) id_5 <= id_17;
      else $display(id_19, id_2 == id_2, 1 !== 1, id_16);
    end
  end
  wire id_20;
  module_0(
      id_20, id_10
  );
endmodule
