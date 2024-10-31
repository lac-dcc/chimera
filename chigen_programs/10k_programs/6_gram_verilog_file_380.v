// Seed: 164712910
module module_0;
  always #1 begin
    fork
      for (id_1 = 1'b0; id_1; id_1 = id_1) begin
        $display(1);
        if (1) $display(id_1, !id_1);
        else $display(id_1, 1, id_1);
      end
      #1 id_1 = id_1;
    join : id_2
  end
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  tri0 id_3;
  assign id_3 = 1 == 1 ? ~id_3 : id_3;
  wire id_4;
  wire id_5;
  always @(1 or posedge id_3) begin
    force id_3 = 1;
  end
  tri id_6;
  reg id_7;
  assign id_7 = id_7 == id_2.id_6;
  module_0();
  always @(posedge 1) id_7 <= 1;
  always force id_2 = 1;
endmodule
