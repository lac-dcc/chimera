// Seed: 2968407235
module module_0;
  id_1(
      .id_0(1), .id_1(id_2)
  );
endmodule
macromodule module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
  module_0();
  wire id_5;
endmodule
module module_2 ();
  assign id_1 = id_1;
  uwire id_2, id_3 = 1'b0;
  module_0();
  assign id_3 = 1;
  assign id_1 = 1;
  always_comb @(posedge id_1 or id_3) begin
    $display(1);
    #1 begin
      id_1 = 1'b0;
    end
  end
endmodule
