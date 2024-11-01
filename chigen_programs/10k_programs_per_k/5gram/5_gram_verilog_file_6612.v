// Seed: 1491212574
module module_0 ();
  wire id_1;
  wire id_2, id_3, id_4, id_5, id_6;
  assign id_1 = id_4;
  wire id_7;
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
    id_9
);
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_10;
  always_ff @(posedge id_10 or posedge 1 == id_9) begin
    id_2 <= id_9 == 1;
    id_4 <= id_9;
  end
  nand (id_1, id_10, id_11, id_3, id_5, id_7, id_9);
  always @(posedge $display !=? id_1++
  or posedge id_9)
  begin
    fork
      begin
        release id_8;
      end
    join
  end
  wire id_11;
  module_0();
endmodule
