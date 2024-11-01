// Seed: 147125593
module module_0;
  wire id_2, id_3, id_4, id_5;
  wire id_6;
endmodule
module module_1 (
    id_1
);
  input wire id_1;
  id_2(
      .id_0(id_1), .id_1(id_3), .id_2(1), .id_3(id_4), .id_4(id_3), .id_5(id_3), .id_6(1)
  ); module_0();
  always $display(1, {id_4 !== 1'h0, 1'b0 + 1, id_1, id_4});
endmodule
