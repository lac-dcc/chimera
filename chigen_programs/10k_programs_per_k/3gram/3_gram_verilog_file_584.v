// Seed: 3563446017
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  module_0(
      id_2, id_1, id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
  wire id_7;
  always @(negedge id_4) id_5 = id_2;
  wor id_8;
  tri0 id_9, id_10;
  wire id_11;
  assign id_4 = 1;
  assign id_9 = 1'h0;
  wire id_12;
  module_0(
      id_11, id_4, id_8
  );
  wire id_13;
  wire id_14;
  id_15 :
  assert property (@(posedge 'b0 == id_8) 1'b0)
  else if (1) begin
    if (id_3) id_2 <= #id_13 id_1;
  end
endmodule
