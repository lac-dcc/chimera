// Seed: 265270940
module module_0 ();
  reg id_1;
  always @* begin
    id_1 <= 1'b0;
  end
  always @(id_1 or negedge id_1++) id_1 <= (id_1);
  wire id_2;
endmodule
module module_1;
  assign id_1[1'b0] = 1;
  genvar id_2;
  module_0();
endmodule
module module_2 (
    input  logic id_0,
    output logic id_1,
    input  tri   id_2
);
  always_comb begin
    forever @(id_0 >= "" or id_2) if (1) deassign id_1;
  end
  module_0();
  always_latch @(1'b0 or posedge id_2) id_1 = 1;
  assign id_1 = id_0 - id_2;
  id_4 :
  assert property (@(posedge {1, 1'b0}) 1'b0)
  else $display(id_1++);
  task id_5;
    begin
      if (1) begin
        id_1 <= id_0;
      end else begin
        $display(id_0, 1 * id_4);
      end
    end
  endtask
  id_6(
      .id_0(1 & id_5[1] < 1 - 1), .id_1(id_1 > id_4), .id_2(id_5), .id_3(1 | id_2)
  );
endmodule
