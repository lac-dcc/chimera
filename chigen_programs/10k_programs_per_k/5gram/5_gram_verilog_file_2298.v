// Seed: 882403899
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wand id_3;
  wor id_4, id_5, id_6;
  assign id_2 = 1 ~^ id_3, id_1 = id_3 - id_6#(.id_4(1));
  always @(posedge id_5 == 1) begin
    disable id_7;
  end
  id_8 :
  assert property (@(posedge 1) 1 == id_3)
  else $display(1);
  wire id_9;
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
    id_12
);
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always_ff @(id_9 or 1) begin
    id_11 <= id_12;
  end
  module_0(
      id_5, id_2
  );
endmodule
