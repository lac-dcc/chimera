// Seed: 90623132
module module_0 (
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
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_9;
  always @(negedge id_4) id_4 <= #(1 & 1) 1;
  assign id_4 = id_4;
  wire id_10, id_11;
  tri id_12;
  assign id_12 = id_6 == 1;
  reg id_13;
  initial
    #(1) begin
      id_13 <= 1;
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = 1;
  assign id_4 = 1;
  xnor (id_2, id_5, id_4, id_3, id_7);
  assign id_6[1] = 1 !=? ~id_7;
  initial begin
    assert (id_2);
    id_4 <= (id_4) ? id_4 : id_4;
  end
  module_0(
      id_1, id_2, id_7, id_4, id_7, id_3, id_2, id_2
  );
endmodule
