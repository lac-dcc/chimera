// Seed: 658757340
`timescale 1ps / 1ps
module module_0 ();
  always @* begin
    if (id_0) begin
      id_0 = 1;
    end else id_0 = id_0;
  end
  always @(posedge 1 - 1) begin
    #id_1 begin
      #1;
    end
    if (id_1) begin
      SystemTFIdentifier(1, id_1);
      id_1 <= id_1;
    end
  end
endmodule
