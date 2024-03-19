module test;

reg clk, cen=1'b1, rst_n, restart;
wire [4:0] env;
reg  [3:0]ctrl;

initial begin
    clk = 1'b0;
    forever clk = #5 ~clk;
end // initial

initial begin
    rst_n = 1'b0;
    #50
    rst_n = 1'b1;
end // initial

reg [7:0] aux;

always @(posedge clk ) begin
    if(~rst_n) begin
        {ctrl,aux} <= 12'd0;
        restart <= 1'b0;
    end else begin
        {ctrl,aux} <= {ctrl,aux} + 12'd1;
        restart <= aux==8'd0;
    end
end

jt49_eg uut(
  .clk		( clk		), 
  .cen		( cen		),
  .rst_n	( rst_n		),
  .restart	( restart	),
  .ctrl		( ctrl		),
  .env		( env		)
);

initial begin
    $dumpfile("test.lxt");
    $dumpvars;
    $dumpon;
    #(10*16*256) $finish;
end

endmodule // test