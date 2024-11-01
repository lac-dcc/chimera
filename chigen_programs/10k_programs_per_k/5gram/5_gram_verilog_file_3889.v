// Seed: 3920950050
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  always @(posedge id_2 or negedge 1) $display();
  reg id_3, id_4, id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12;
  integer id_13, id_14;
  always @(1 + 1) force id_12 = id_4;
  reg id_15;
  assign id_2 = 1;
  always_ff @(posedge id_8) begin
    id_15 <= id_9;
  end
  id_16(
      .id_0(1),
      .id_1(id_5),
      .id_2(1),
      .id_3({1{id_14}}),
      .id_4(1),
      .id_5(1),
      .id_6(),
      .id_7(id_4),
      .id_8(id_12),
      .id_9(id_10),
      .id_10(1'b0),
      .id_11(1),
      .id_12(id_6)
  );
endmodule
module module_1 (
    output tri0  id_0,
    input  uwire id_1,
    output logic id_2
);
  assign id_2 = id_1 ? 1'b0 : 1;
  always
  fork : id_4
    id_2 <= #1 id_4;
    id_5(id_5, (1 == 1), 1);
    id_6;
  join : id_7
  module_0(
      id_5, id_5
  );
endmodule
