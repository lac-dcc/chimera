// Seed: 3643419330
module module_0 ();
  id_1(
      .id_0(id_2), .id_1(1), .id_2(id_2["" : 1] - 1'b0), .id_3(id_2(id_2)), .id_4(id_2), .id_5(id_2)
  );
endmodule
module module_1 (
    output logic id_0
);
  always @(id_2 or posedge 1) begin
    repeat (id_2)
    for (id_0 = 1 == 1; 1; id_0 = 1)
    for (id_2 = 1; 1 == 1; id_2 = 1) begin
      id_2 <= 1;
      id_0 <= id_2;
    end
  end
  reg id_3;
  always @(1'b0)
    if (id_3) #1;
    else begin
      fork
        #1 id_2 = id_3;
      join
    end
  module_0();
endmodule
