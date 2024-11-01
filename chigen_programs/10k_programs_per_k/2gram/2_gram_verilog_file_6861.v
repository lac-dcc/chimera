// Seed: 272846491
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always deassign id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  initial id_1 <= 1;
  assign id_5 = 1 - -id_2;
  assign id_1 = id_3;
  tri0 id_6;
  wor  id_7;
  tri0 id_8;
  always #id_9
    #1
      @(id_6 or id_8 - 1)
        if (!id_9)
          @(posedge (1)) begin
            id_1 = 1'b0 - 1'b0;
          end
  assign id_7 = id_3 <-> 1 != 'b0;
  wire id_10;
  assign id_6 = id_7;
  module_0(
      id_2, id_6, id_10, id_9
  );
  wire id_11;
endmodule
