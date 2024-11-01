// Seed: 4001928120
module module_0;
  id_1(
      ~id_2, 1, 1'd0
  );
  initial $display(1, 1);
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  assign id_3 = 1;
  assign id_3 = id_1;
  id_4(
      .id_0(id_1 | id_5),
      .id_1(1'b0),
      .id_2(1),
      .id_3(1 ==? id_2),
      .id_4(1 == id_3),
      .id_5(),
      .id_6(1),
      .id_7(1'b0),
      .id_8(id_1),
      .id_9(id_3)
  );
  always #0 begin
    if ("")
      assume (id_5);
      else id_5 <= 1'b0;
  end
  wire id_6;
  wire id_7;
  initial
  fork : id_8
  join : id_9
  tri0 id_10;
  assign id_10 = id_8 !=? 1;
  module_0();
endmodule
