// Seed: 700265320
module module_0 (
    output wire id_0,
    input  tri1 id_1,
    input  tri0 id_2,
    input  wand id_3,
    output tri  id_4,
    input  tri  id_5,
    output wire id_6
);
  assign id_0 = (id_1);
  module_2();
endmodule
module module_1 (
    input  wire id_0,
    input  wand id_1,
    output tri  id_2
);
  module_0(
      id_2, id_1, id_1, id_0, id_2, id_1, id_2
  );
endmodule
module module_2;
  always begin
    $display(1'b0, 1, 1, 1, id_1, 1'h0, {id_1, id_1 ? id_1 : id_1}, 1);
  end
endmodule
