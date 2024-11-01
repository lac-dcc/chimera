// Seed: 2964269331
module module_0;
  initial
  fork : id_1
  join_none : id_2
  always @(posedge 1 or posedge 1'b0) begin
    $display(1, id_2 * 1);
  end
  supply1 id_3;
  reg id_4;
  tri0 id_5;
  assign id_3 = 1;
  always @(posedge 1) begin
    id_2 <= 1'b0;
    id_4 <= id_5 << id_4;
  end
  wire id_6;
endmodule
module module_1 (
    output logic id_0,
    output supply0 id_1,
    output logic id_2,
    input logic id_3,
    output wand id_4
);
  always @(id_3 | 1 ^ 1 or negedge !id_3) begin
    if (1) begin
      if (1'd0) begin
        id_2 <= id_3;
      end else id_2 <= 1;
    end else begin
      #1;
      if (id_3) id_0 <= 1'b0;
      else begin
        if (1) begin
          deassign id_2.id_3;
        end
      end
    end
  end
  id_6(
      .id_0(1),
      .id_1(1),
      .id_2(""),
      .id_3(1),
      .id_4(1'b0 | id_1),
      .id_5(~id_2),
      .id_6(1),
      .id_7({1{id_4}})
  ); module_0();
endmodule
