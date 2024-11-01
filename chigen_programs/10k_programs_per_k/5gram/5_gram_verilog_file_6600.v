// Seed: 3869654479
module module_0 ();
  assign id_1 = 1;
  reg id_2 = id_2++;
  assign id_2 = 1'b0;
  always @(posedge 1) begin
    id_1 = id_2;
    #1;
    id_1 <= 1 ==? id_1 < id_2++;
    disable id_3;
    fork
      id_1 <= #1 id_3;
      id_1 <= 1;
      id_4;
    join
  end
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
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  id_13(
      1 == id_8, id_1, 1
  ); module_0();
endmodule
