// Seed: 357359698
module module_0 (
    input  wire id_0,
    input  wand id_1,
    input  tri1 id_2,
    input  tri1 id_3,
    output wire id_4
);
  wire id_6;
  module_2();
endmodule
module module_1 (
    input  wand id_0,
    output tri1 id_1
);
  assign id_1 = 1;
  logic [7:0] id_3;
  module_0(
      id_0, id_0, id_0, id_0, id_1
  );
  wire id_4;
  assign id_3[1] = id_3;
endmodule
module module_2;
  reg id_1;
  reg id_2;
  always begin
    assign id_1 = 1;
    fork
      #1 id_1 = id_2;
      begin
        if (1'b0) id_2 = id_2;
        id_1 <= id_1;
      end
    join
    $display(1);
    begin
      id_1 <= id_1;
    end
    id_2 = id_1;
  end
endmodule
