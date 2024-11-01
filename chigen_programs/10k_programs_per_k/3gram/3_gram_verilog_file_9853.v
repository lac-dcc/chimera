// Seed: 1827744712
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge 1) id_8 <= 1;
  wire id_10;
  wire id_11 = !1;
  always_comb
  fork : id_12
    id_10 = id_3;
    $display(id_4);
    id_6 = 1;
  join : id_13
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(*) begin
    id_5 = 1;
    id_1 <= 1 + 1;
  end
  module_0(
      id_3, id_6, id_3, id_2, id_3, id_4, id_5, id_1, id_3
  );
  always @(posedge 1) disable id_7;
endmodule
