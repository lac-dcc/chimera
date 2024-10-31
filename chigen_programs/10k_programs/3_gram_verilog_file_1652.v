// Seed: 2817628731
module module_0 ();
  id_1(
      .id_0(id_2), .id_1(id_2), .id_2(1)
  );
  wire id_4, id_5;
  module_2();
endmodule
module module_1;
  module_0();
  integer id_2;
endmodule
module module_2 ();
  id_1 :
  assert property (@(posedge id_1) id_1)
  else id_1 <= 1;
  assign id_1 = id_1;
  reg id_2;
  assign id_1 = id_2;
  always @(1) id_1 <= 1;
endmodule
module module_3 (
    output logic id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input tri1 id_4,
    input wand id_5,
    input supply1 id_6,
    input tri id_7,
    input wor id_8,
    input supply1 id_9,
    input wand id_10
);
  assign id_0 = (1) - 1;
  always
  fork
    id_0 <= 1;
    id_0 <= 1;
  join_any
  module_2();
  always @(posedge id_3) begin
    id_0 <= 1 - id_3;
  end
  wire id_12;
  final $display(1'b0);
endmodule
