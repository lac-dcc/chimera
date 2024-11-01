// Seed: 172619104
module module_0;
  wire id_1;
  wire id_2, id_3, id_4, id_5, id_6;
  always force id_2 = 1;
endmodule
module module_1 ();
  wire id_2;
  module_0();
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
    id_12
);
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wor id_13 = 1;
  assign id_11[1] = id_2;
  module_0();
  wire id_14;
  always @(posedge id_11) begin
    fork
      id_15(id_13);
      repeat (id_13 * id_11) begin
        id_9 <= 1;
      end
    join
  end
endmodule
